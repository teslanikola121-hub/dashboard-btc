"use client";

import { Bitcoin } from "lucide-react";
import { usePathname } from "next/navigation";

export default function Topbar() {

  const pathname = usePathname();

  const pageName =
    pathname
      .split("/")
      .filter(Boolean)
      .pop()
      ?.replace(/-/g, " ") || "dashboard";

  const title =
    pageName.charAt(0).toUpperCase() +
    pageName.slice(1);

  return (

    <header className="topbar">

      <div>

        <div className="page-title">
          {title}
        </div>

        <div className="breadcrumb">
          BTC Terminal / {title}
        </div>

      </div>

      <div className="topbar-right">

        <div className="btc-price">

          <Bitcoin size={18} />

          <span>BTC</span>

          <strong>
            $109,650
          </strong>

          <span className="positive">
            +1.82%
          </span>

        </div>

        <div className="connection">

          <span className="status-dot" />

          Connected

        </div>

      </div>

    </header>
  );
}
