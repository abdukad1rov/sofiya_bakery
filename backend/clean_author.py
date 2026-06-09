def commit_callback(commit):
    if commit.committer_name == b"jahongirdev1":
        commit.committer_name = b"abdukad1rov"
        commit.committer_email = b"farhadabdukadirov007@gmail.com"
    if commit.author_name == b"jahongirdev1":
        commit.author_name = b"abdukad1rov"
        commit.author_email = b"farhadabdukadirov007@gmail.com"