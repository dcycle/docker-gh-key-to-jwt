This project helps you generate a JWT from a private key and is meant for developers of GitHub apps.

Usage
-----

Make sure you are the publisher of a GitHub app, and create a private key to access that app.

Visit [Authenticating with GitHub Apps](https://docs.github.com/en/developers/apps/building-github-apps/authenticating-with-github-apps#authenticating-as-a-github-app), which has more on the topic.

Once you have a private key, download it to your computer at `/path/to/key.pem`.

Clone this repo:

    git clone docker-gh-key-to-jwt
    cd docker-gh-key-to-jwt
