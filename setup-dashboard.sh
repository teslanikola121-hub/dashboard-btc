#!/bin/bash

set -e

echo "======================================"
echo " BTC Trading Dashboard Structure"
echo "======================================"

# =========================================================
# DIRECTORIES
# =========================================================

mkdir -p \
app/dashboard \
app/market/btc \
app/market/timeframe \
app/market/order-book \
app/market/liquidation \
app/market/open-interest \
app/market/funding \
app/trading/setup \
app/trading/position \
app/trading/risk-reward \
app/trading/journal \
app/analysis/technical \
app/analysis/regime \
app/analysis/ai \
app/analysis/news \
app/analysis/on-chain \
app/strategy/backtest \
app/strategy/strategy \
app/strategy/performance \
app/strategy/optimization \
app/data/price \
app/data/indicators \
app/data/sources \
app/system/api \
app/system/websocket \
app/system/settings \
components/layout

# =========================================================
# SHARED SIDEBAR
# =========================================================

cat > components/layout/Sidebar.tsx <<'EOF'
"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

import {
  Activity,
  BarChart3,
  Bitcoin,
  BookOpen,
  Brain,
  CandlestickChart,
  CircleDollarSign,
  Database,
  Gauge,
  LayoutDashboard,
  LineChart,
  List,
  Newspaper,
  Settings,
  Shield,
  Target,
  TrendingUp,
  Wallet,
  Zap,
} from "lucide-react";

const menuGroups = [
  {
    title: "Dashboard",
    items: [
      {
        name: "Overview",
        href: "/dashboard",
        icon: LayoutDashboard,
      },
    ],
  },

  {
    title: "Market",
    items: [
      {
        name: "BTC/USDT",
        href: "/market/btc",
        icon: Bitcoin,
      },
      {
        name: "Multi Timeframe",
        href: "/market/timeframe",
        icon: CandlestickChart,
      },
      {
        name: "Order Book",
        href: "/market/order-book",
        icon: List,
      },
      {
        name: "Liquidation",
        href: "/market/liquidation",
        icon: Zap,
      },
      {
        name: "Open Interest",
        href: "/market/open-interest",
        icon: BarChart3,
      },
      {
        name: "Funding Rate",
        href: "/market/funding",
        icon: CircleDollarSign,
      },
    ],
  },

  {
    title: "Trading",
    items: [
      {
        name: "Trade Setup",
        href: "/trading/setup",
        icon: Target,
      },
      {
        name: "Position",
        href: "/trading/position",
        icon: Wallet,
      },
      {
        name: "Risk / Reward",
        href: "/trading/risk-reward",
        icon: Shield,
      },
      {
        name: "Trade Journal",
        href: "/trading/journal",
        icon: BookOpen,
      },
    ],
  },

  {
    title: "Analysis",
    items: [
      {
        name: "Technical Analysis",
        href: "/analysis/technical",
        icon: LineChart,
      },
      {
        name: "Market Regime",
        href: "/analysis/regime",
        icon: Gauge,
      },
      {
        name: "AI Analysis",
        href: "/analysis/ai",
        icon: Brain,
      },
      {
        name: "News & Sentiment",
        href: "/analysis/news",
        icon: Newspaper,
      },
      {
        name: "On-Chain",
        href: "/analysis/on-chain",
        icon: Activity,
      },
    ],
  },

  {
    title: "Strategy",
    items: [
      {
        name: "Backtest",
        href: "/strategy/backtest",
        icon: BarChart3,
      },
      {
        name: "Strategy",
        href: "/strategy/strategy",
        icon: TrendingUp,
      },
      {
        name: "Performance",
        href: "/strategy/performance",
        icon: Gauge,
      },
      {
        name: "Optimization",
        href: "/strategy/optimization",
        icon: Zap,
      },
    ],
  },

  {
    title: "Data",
    items: [
      {
        name: "Price Data",
        href: "/data/price",
        icon: Database,
      },
      {
        name: "Indicators",
        href: "/data/indicators",
        icon: Activity,
      },
      {
        name: "Data Sources",
        href: "/data/sources",
        icon: Database,
      },
    ],
  },

  {
    title: "System",
    items: [
      {
        name: "API Status",
        href: "/system/api",
        icon: Activity,
      },
      {
        name: "WebSocket",
        href: "/system/websocket",
        icon: Zap,
      },
      {
        name: "Settings",
        href: "/system/settings",
        icon: Settings,
      },
    ],
  },
];

export default function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="sidebar">

      <div className="logo">

        <div className="logo-icon">
          <Bitcoin size={22} />
        </div>

        <div>
          <div className="logo-title">
            BTC Terminal
          </div>

          <div className="logo-subtitle">
            Trading Dashboard
          </div>
        </div>

      </div>

      <div className="market-status">
        <span className="status-dot" />
        Market Live
      </div>

      <nav className="menu">

        {menuGroups.map((group) => (

          <div
            className="menu-group"
            key={group.title}
          >

            <div className="menu-title">
              {group.title}
            </div>

            {group.items.map((item) => {

              const Icon = item.icon;

              const active =
                pathname === item.href ||
                pathname.startsWith(item.href + "/");

              return (

                <Link
                  key={item.href}
                  href={item.href}
                  className={
                    `menu-item ${
                      active ? "active" : ""
                    }`
                  }
                >

                  <Icon size={18} />

                  <span>
                    {item.name}
                  </span>

                </Link>

              );

            })}

          </div>

        ))}

      </nav>

    </aside>
  );
}
EOF

# =========================================================
# TOPBAR
# =========================================================

cat > components/layout/Topbar.tsx <<'EOF'
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
EOF

# =========================================================
# ROOT LAYOUT
# =========================================================

cat > app/layout.tsx <<'EOF'
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
EOF

# =========================================================
# ROOT PAGE
# =========================================================

cat > app/page.tsx <<'EOF'
import { redirect } from "next/navigation";

export default function Home() {
  redirect("/dashboard");
}
EOF

# =========================================================
# PAGE GENERATOR
# =========================================================

create_page() {

  FILE="$1"
  TITLE="$2"
  DESCRIPTION="$3"

  mkdir -p "$(dirname "$FILE")"

  cat > "$FILE" <<EOF
export default function Page() {

  return (

    <div className="page">

      <div className="page-header">

        <div>

          <h1>
            $TITLE
          </h1>

          <p>
            $DESCRIPTION
          </p>

        </div>

      </div>

      <div className="page-placeholder">

        <div className="placeholder-icon">
          $TITLE
        </div>

        <h2>
          $TITLE
        </h2>

        <p>
          Modul ini siap dikembangkan.
        </p>

      </div>

    </div>
  );
}
EOF
}

# =========================================================
# DASHBOARD
# =========================================================

create_page \
app/dashboard/page.tsx \
"Dashboard Overview" \
"Overview market Bitcoin dan kondisi trading."

# =========================================================
# MARKET
# =========================================================

create_page \
app/market/btc/page.tsx \
"BTC / USDT" \
"Bitcoin price dan market overview."

create_page \
app/market/timeframe/page.tsx \
"Multi Timeframe" \
"Analisis Bitcoin dari beberapa timeframe."

create_page \
app/market/order-book/page.tsx \
"Order Book" \
"Bid, ask, depth dan liquidity."

create_page \
app/market/liquidation/page.tsx \
"Liquidation" \
"Data liquidation market Bitcoin."

create_page \
app/market/open-interest/page.tsx \
"Open Interest" \
"Open interest futures Bitcoin."

create_page \
app/market/funding/page.tsx \
"Funding Rate" \
"Funding rate futures Bitcoin."

# =========================================================
# TRADING
# =========================================================

create_page \
app/trading/setup/page.tsx \
"Trade Setup" \
"Trading setup dan entry plan."

create_page \
app/trading/position/page.tsx \
"Position" \
"Open position dan position management."

create_page \
app/trading/risk-reward/page.tsx \
"Risk / Reward" \
"Risk management dan risk reward calculator."

create_page \
app/trading/journal/page.tsx \
"Trade Journal" \
"Catatan dan histori trading."

# =========================================================
# ANALYSIS
# =========================================================

create_page \
app/analysis/technical/page.tsx \
"Technical Analysis" \
"Indikator dan technical analysis."

create_page \
app/analysis/regime/page.tsx \
"Market Regime" \
"Trend dan kondisi market."

create_page \
app/analysis/ai/page.tsx \
"AI Analysis" \
"Analisis market menggunakan AI."

create_page \
app/analysis/news/page.tsx \
"News & Sentiment" \
"News dan sentiment market."

create_page \
app/analysis/on-chain/page.tsx \
"On-Chain" \
"Analisis data blockchain Bitcoin."

# =========================================================
# STRATEGY
# =========================================================

create_page \
app/strategy/backtest/page.tsx \
"Backtest" \
"Backtesting strategy menggunakan data historis."

create_page \
app/strategy/strategy/page.tsx \
"Strategy" \
"Daftar dan konfigurasi trading strategy."

create_page \
app/strategy/performance/page.tsx \
"Performance" \
"Performance trading strategy."

create_page \
app/strategy/optimization/page.tsx \
"Optimization" \
"Optimasi parameter trading strategy."

# =========================================================
# DATA
# =========================================================

create_page \
app/data/price/page.tsx \
"Price Data" \
"Historical Bitcoin price data."

create_page \
app/data/indicators/page.tsx \
"Indicators" \
"Technical indicator data."

create_page \
app/data/sources/page.tsx \
"Data Sources" \
"Data source dan koneksi market."

# =========================================================
# SYSTEM
# =========================================================

create_page \
app/system/api/page.tsx \
"API Status" \
"Status backend API."

create_page \
app/system/websocket/page.tsx \
"WebSocket" \
"Realtime market connection."

create_page \
app/system/settings/page.tsx \
"Settings" \
"Pengaturan dashboard."

# =========================================================
# FINISHED
# =========================================================

echo ""
echo "======================================"
echo " Dashboard structure created!"
echo "======================================"
echo ""
echo "Routes:"
echo ""
echo "/dashboard"
echo "/market/btc"
echo "/market/timeframe"
echo "/market/order-book"
echo "/market/liquidation"
echo "/market/open-interest"
echo "/market/funding"
echo ""
echo "/trading/setup"
echo "/trading/position"
echo "/trading/risk-reward"
echo "/trading/journal"
echo ""
echo "/analysis/technical"
echo "/analysis/regime"
echo "/analysis/ai"
echo "/analysis/news"
echo "/analysis/on-chain"
echo ""
echo "/strategy/backtest"
echo "/strategy/strategy"
echo "/strategy/performance"
echo "/strategy/optimization"
echo ""
echo "/data/price"
echo "/data/indicators"
echo "/data/sources"
echo ""
echo "/system/api"
echo "/system/websocket"
echo "/system/settings"
echo ""
echo "Done."