import "./globals.css";

import Sidebar from "@/components/layout/Sidebar";
import Topbar from "@/components/layout/Topbar";

export const metadata = {
  title: "BTC Trading Dashboard",
  description: "Bitcoin trading terminal",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {

  return (

    <html lang="en">

      <body>

        <div className="dashboard">

          <Sidebar />

          <main className="main">

            <Topbar />

            <section className="content">
              {children}
            </section>

          </main>

        </div>

      </body>

    </html>
  );
}
