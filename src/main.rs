use std::io;
use tokio::{io::AsyncWriteExt, net::TcpListener};

#[tokio::main]
async fn main() -> io::Result<()> {
    let str = "Hello, World!";
    println!("{}", str);

    let listener = TcpListener::bind("localhost:8000").await?;
    loop {
        let (mut socket, _) = listener.accept().await?;

        tokio::spawn(async move { socket.write_all(b"hello from Tokio\n").await });
    }
}
