This project helps you generate a JWT from a private key and is meant for developers of GitHub apps.

Usage
-----

Make sure you are the publisher of a GitHub App (not a GitHub oAuth App), and create a private key to access that app.

Visit [Authenticating with GitHub Apps](https://docs.github.com/en/developers/apps/building-github-apps/authenticating-with-github-apps#authenticating-as-a-github-app), which has more on the topic.

Once you have a private key, download it to your computer at `/path/to/key.pem`.

Clone this repo:

    git clone https://github.com/dcycle/docker-gh-key-to-jwt.git
    cd docker-gh-key-to-jwt

Generate a JWT which expires after 10 minutes. This takes **three** arguments, first the path to the directory contain your private key ("/path/to"); second, the filename of your private key ("key.pem"); and third, your GitHub app's ID:

    ./scripts/generate-jwt.sh /path/to key.pem 12345

Resources
-----

* [The Ruby Docker image](https://hub.docker.com/_/ruby)
* [Alpine and Docker, a perfect fit, April 21, 2022, Dcycle blog](https://blog.dcycle.com/blog/2022-04-21/alpine-docker/)
