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
