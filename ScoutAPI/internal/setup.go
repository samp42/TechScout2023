package internal

import (
	"context"
	"fmt"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"net/http"
	"os"
)

func StartApp() (e *echo.Echo, db *mongo.Client) {
	// setup echo middleware
	e = echo.New()
	e.Use(middleware.Logger())

	// load environment
	if err := LoadEnv(e); err != nil {
		e.Logger.Fatalf("Error loading environment: %v")
	}

	e.Logger.Printf("Loaded environment: %v", os.Getenv("ENV"))

	// setup mongo connection
	mongoUri := os.Getenv("MONGO_URI")

	if mongoUri == "" {
		e.Logger.Fatal("MONGO_URI not set")
	}

	db, err = mongo.Connect(context.TODO(), options.Client().ApplyURI(mongoUri))

	if err != nil {
		e.Logger.Fatalf("Error connecting to MongoDB: %v", err)
	}

	// close mongo db on exit
	defer func() {
		if err := db.Disconnect(context.TODO()); err != nil {
			e.Logger.Fatalf("Error disconnecting from mongo: %v", err)
		}
	}()

	// register routes
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})

	// start server, exit if error
	e.Logger.Fatalf("Error starting app, got error: %v", err, e.Start(":8080"))

	// return instances
	return e, db
}

func LoadEnv(e *echo.Echo) error {
	env := "local"

	if len(os.Args) > 1 {
		env = os.Args[1]
	} else {
		e.Logger.Info("No environment specified, defaulting to local")
	}

	return godotenv.Load(fmt.Sprint("config/.env.", env))
}
