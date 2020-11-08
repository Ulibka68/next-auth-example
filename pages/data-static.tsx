import Layout from "../components/layout";
import { GetStaticProps, InferGetStaticPropsType } from "next";

// eslint-disable-next-line no-restricted-syntax
export default function Page(
  props: InferGetStaticPropsType<typeof getStaticProps>
) {
  return (
    <Layout>
      <h1>заготовка для MySQL - getStaticProps </h1>
      <p>{props.posts[0].author}</p>
    </Layout>
  );
}

type Post = {
  author: string;
  content: string;
};

type PostProps = { posts: Post[] };

/*
The context parameter is an object containing the following keys:

    params contains the route parameters for pages using dynamic routes. For example, if the page name is [id].js , then params will look like { id: ... }. To learn more, take a look at the Dynamic Routing documentation. You should use this together with getStaticPaths, which we’ll explain later.

    preview is true if the page is in the preview mode and undefined otherwise. See the Preview Mode documentation.

    previewData contains the preview data set by setPreviewData. See the Preview Mode documentation.

    locale contains the active locale (if enabled).
    locales contains all supported locales (if enabled).
    defaultLocale contains the configured default locale (if enabled).
*/

export const getStaticProps: GetStaticProps<PostProps> = async (context) => {
  // const res = await fetch("https://.../posts");
  // const posts: Post[] = await res.json();
  const posts: PostProps = {
    posts: [
      { author: "au1", content: "asd jahs d" },
      { author: "au2", content: "asd asd asdasd" },
    ],
  };

  return {
    props: posts,
    revalidate: 1, // In seconds
  };
};
