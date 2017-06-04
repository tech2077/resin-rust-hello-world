extern crate iron;

use iron::prelude::*;
use iron::status;

fn main() {
    println!("Server Starting!");
    Iron::new(|_: &mut Request| {
        Ok(Response::with((status::Ok, "Hello, World!")))
    }).http("0.0.0.0:80").unwrap();
}