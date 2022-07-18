import blog from "https://deno.land/x/blog@0.4.1/blog.tsx";

blog({
  title: "okamog",
  author: "okamo",
  avatar: "./okamo.jpg",
  avatarClass: "rounded-full",
  ogImage: "./okamo.jpg",
  links: [
    { title: "Email", url: "mailto:okamo1984@gmail.com" },
    { title: "GitHub", url: "https://github.com/okamo1984" },
    { title: "Twitter", url: "https://twitter.com/okamo1984" },
  ],
  lang: "ja",
  dateStyle: "long",
  favicon: "favicon.ico",
});
