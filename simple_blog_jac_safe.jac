# simple_blog_jac_safe.jac - richer example (no `can` methods)
node User {
    has username: str;
    has email: str;
    has bio: str;
}

node Post {
    has title: str;
    has content: str;
    has created_at: str;
}

with entry {
    alice = root ++> User(username="alice", email="alice@example.com", bio="Loves Jac and graphs");
    bob   = root ++> User(username="bob", email="bob@example.com", bio="Graph thinker");

    p1 = alice[0] ++> Post(title="Hello Jac!", content="My first post in Jac", created_at="2025-10-01");
    p2 = bob[0]   ++> Post(title="Graph ideas", content="Using Jac to model relations", created_at="2025-10-01");

    # print summary lines (method-like outputs without using `can`)
    print("User " + alice[0].username + " created post: " + p1[0].title);
    print("User " + bob[0].username + " created post: " + p2[0].title);

    print("---- details ----");
    print(alice[0].username + " <" + alice[0].email + "> - " + alice[0].bio);
    print("Post: " + p1[0].title + " | " + p1[0].content[0:40] + "..." + " @ " + p1[0].created_at);
}
