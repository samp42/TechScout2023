commits = $(git log --format=%H main..${{ github.ref_name }})

# git log main..${{ github.ref_name }}