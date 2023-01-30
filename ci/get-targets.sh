commits = $(git log --format=%H main..$1)

# git log main..${{ github.ref_name }}