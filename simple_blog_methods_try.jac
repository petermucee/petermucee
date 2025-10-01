# simple_blog_methods_try.jac - attempt including can methods (may be incompatible)
node User {
    has username: str;
    has email: str;
    has bio: str;

    can show_info() {
        print("User " + self.username + " <" + self.email + ">");
    }
}

node Post {
    has title: str;
    has content: str;
    has created_at: str;

    can summary() {
        print("Post: " + self.title + " -> " + self.content[0:40] + "...");
    }
}

with entry {
    alice = root ++> User(username="alice", email="alice@example.com", bio="Loves Jac");
    p1 = alice[0] ++> Post(title="Hello Jac!", content="My first post in Jac", created_at="2025-10-01");

    alice[0].show_info();
    p1[0].summary();
}
