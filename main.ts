import blog, { ga, redirects } from "https://deno.land/x/blog@0.3.3/blog.tsx";

blog({
  title: "okamog",
  author: "okamo",
  avatar: "./okamo.jpg",
  avatarClass: "rounded-full",
  background: "#f9f9f9",
  links: [
    { title: "Email", url: "mailto:okamo1984@gmail.com" },
    { title: "GitHub", url: "https://github.com/okamo1984" },
    { title: "Twitter", url: "https://twitter.com/okamo1984" },
  ],

  // middlewares: [
  //   // If you want to set up Google Analytics, paste your GA key here.
  //   ga("UA-XXXXXXXX-X"),

  //   // If you want to provide some redirections, you can specify them here,
  //   // pathname specified in a key will redirect to pathname in the value.
  //   redirects({
  //     "/hello_world.html": "/hello_world",
  //   }),
  // ],
});
