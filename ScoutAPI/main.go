package main

import (
	"ScoutAPI/internal"
	"context"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"net/http"
	"os"
)

func main() {
	// setup echo middleware
	e := echo.New()
	e.Use(middleware.Logger())

	// load environment
	if err := internal.LoadEnv(e); err != nil {
		e.Logger.Fatalf("Error loading environment: %v")
	}

	e.Logger.Printf("Loaded environment: %v", os.Getenv("ENV"))

	// setup mongo connection
	mongoUri := os.Getenv("MONGO_URI")

	if mongoUri == "" {
		e.Logger.Fatal("MONGO_URI not set")
	}

	client, err := mongo.Connect(context.TODO(), options.Client().ApplyURI(mongoUri))

	// close mongo client on exit
	defer func() {
		if err := client.Disconnect(context.TODO()); err != nil {
			e.Logger.Fatalf("Error disconnecting from mongo: %v", err)
		}
	}()

	if err != nil {
		e.Logger.Fatalf("Error connecting to MongoDB: %v", err)
	}

	// register routes
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})

	// start server, exit if error
	e.Logger.Fatal(e.Start(":8080"))
}
