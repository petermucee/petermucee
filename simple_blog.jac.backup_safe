# simple_blog.jac - richer example using walkers (safe variant)

node User {
    has username: str;
    has email: str;
}

node Post {
    has title: str;
    has content: str;
}

# walker to show user info (acts like a method)
walker show_info(user) {
    print("User " + user.username + " <" + user.email + ">")
}

# walker to print a short post summary
walker summary_post(post) {
    print("Post: " + post.title + " -> " + post.content[0:40] + "...")
}

with entry {
    alice = root ++> User(username="alice", email="alice@example.com");
    bob   = root ++> User(username="bob", email="bob@example.com");

    p1 = alice[0] ++> Post(title="Hello Jac!", content="My first post in Jac");
    p2 = bob[0]   ++> Post(title="Graph ideas", content="Using Jac to model relations");

    print("User " + alice[0].username + " created post: " + p1[0].title);
    print("User " + bob[0].username + " created post: " + p2[0].title);

    # call the walkers (like calling methods)
    show_info(alice[0]);
    summary_post(p1[0]);
}
