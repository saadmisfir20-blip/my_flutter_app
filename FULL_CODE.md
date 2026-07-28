# ابن مسفر للتجارة — الكود الكامل

هذا الملف يجمع كل أكواد المشروع في مكان واحد، مرتبة حسب المجلدات الأصلية.

---

## 1. `index.html`

```html
<!doctype html>
<html lang="ar" dir="rtl">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ابن مسفر للتجارة | مواد البناء والمعدات</title>
    <meta name="description" content="ابن مسفر للتجارة - مواد البناء والمعدات في ريمة - الجبين - الشارع العام. حديد، أسمنت، أدوات صحية، معدات بناء." />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&family=Cairo:wght@600;700;800;900&display=swap" rel="stylesheet" />
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
```

---

## 2. `package.json`

```json
{
  "name": "vite-react-typescript-starter",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "lint": "eslint .",
    "preview": "vite preview",
    "typecheck": "tsc --noEmit -p tsconfig.app.json"
  },
  "dependencies": {
    "@supabase/supabase-js": "^2.57.4",
    "lucide-react": "^0.344.0",
    "react": "^18.3.1",
    "react-dom": "^18.3.1"
  },
  "devDependencies": {
    "@eslint/js": "^9.9.1",
    "@types/react": "^18.3.5",
    "@types/react-dom": "^18.3.0",
    "@vitejs/plugin-react": "^4.3.1",
    "autoprefixer": "^10.4.18",
    "eslint": "^9.9.1",
    "eslint-plugin-react-hooks": "^5.1.0-rc.0",
    "eslint-plugin-react-refresh": "^0.4.11",
    "globals": "^15.9.0",
    "postcss": "^8.4.35",
    "tailwindcss": "^3.4.1",
    "typescript": "^5.5.3",
    "typescript-eslint": "^8.3.0",
    "vite": "^5.4.2"
  }
}
```

---

## 3. `tailwind.config.js`

```js
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Tajawal', 'system-ui', 'sans-serif'],
        display: ['Cairo', 'Tajawal', 'sans-serif'],
      },
      colors: {
        brand: {
          50: '#fff8ed',
          100: '#ffefd3',
          200: '#fed9a5',
          300: '#fdbc6e',
          400: '#fc9b36',
          500: '#f97316',
          600: '#ea580c',
          700: '#c2410c',
          800: '#9a3412',
          900: '#7c2d12',
          950: '#431407',
        },
        ink: {
          50: '#f6f7f9',
          100: '#eceef2',
          200: '#d4d9e2',
          300: '#aeb7c8',
          400: '#8290a8',
          500: '#63718c',
          600: '#4e5a73',
          700: '#40495e',
          800: '#383f50',
          900: '#1f2433',
          950: '#141826',
        },
      },
      keyframes: {
        'fade-up': {
          '0%': { opacity: '0', transform: 'translateY(24px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        'fade-in': {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        'float': {
          '0%,100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-10px)' },
        },
      },
      animation: {
        'fade-up': 'fade-up 0.7s ease-out both',
        'fade-in': 'fade-in 0.8s ease-out both',
        'float': 'float 6s ease-in-out infinite',
      },
    },
  },
  plugins: [],
};
```

---

## 4. `src/main.tsx`

```tsx
import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import App from './App.tsx';
import './index.css';

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>
);
```

---

## 5. `src/index.css`

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  html {
    scroll-behavior: smooth;
  }
  body {
    @apply bg-ink-950 text-ink-100 font-sans antialiased;
  }
  ::selection {
    @apply bg-brand-500/30 text-white;
  }
}

@layer components {
  .container-x {
    @apply mx-auto w-full max-w-7xl px-5 sm:px-8 lg:px-10;
  }
  .section-pad {
    @apply py-20 lg:py-28;
  }
  .btn-primary {
    @apply inline-flex items-center justify-center gap-2 rounded-xl bg-brand-500 px-6 py-3 text-base font-bold text-white shadow-lg shadow-brand-500/25 transition-all duration-300 hover:bg-brand-400 hover:shadow-brand-400/40 hover:-translate-y-0.5 active:translate-y-0;
  }
  .btn-ghost {
    @apply inline-flex items-center justify-center gap-2 rounded-xl border border-white/15 bg-white/5 px-6 py-3 text-base font-bold text-white backdrop-blur transition-all duration-300 hover:bg-white/10 hover:border-white/30;
  }
  .card-surface {
    @apply rounded-2xl border border-white/10 bg-ink-900/60 backdrop-blur-sm;
  }
  .form-input {
    @apply w-full rounded-xl border border-white/10 bg-ink-950/60 px-4 py-3 text-sm text-white placeholder:text-ink-500 transition-all duration-200 focus:border-brand-500/60 focus:bg-ink-950/80 focus:outline-none focus:ring-2 focus:ring-brand-500/20;
  }
  .blueprint-grid {
    background-image:
      linear-gradient(rgba(249, 115, 22, 0.06) 1px, transparent 1px),
      linear-gradient(90deg, rgba(249, 115, 22, 0.06) 1px, transparent 1px);
    background-size: 44px 44px;
  }
}

/* custom scrollbar */
::-webkit-scrollbar {
  width: 10px;
}
::-webkit-scrollbar-track {
  background: #141826;
}
::-webkit-scrollbar-thumb {
  background: #40495e;
  border-radius: 999px;
}
::-webkit-scrollbar-thumb:hover {
  background: #4e5a73;
}
```

---

## 6. `src/App.tsx`

```tsx
import Navbar from '@/components/Navbar';
import Hero from '@/components/Hero';
import Categories from '@/components/Categories';
import OrderForm from '@/components/OrderForm';
import Contact from '@/components/Contact';
import Footer from '@/components/Footer';

export default function App() {
  return (
    <div className="min-h-screen bg-ink-950 text-ink-100">
      <Navbar />
      <main>
        <Hero />
        <Categories />
        <OrderForm />
        <Contact />
      </main>
      <Footer />
    </div>
  );
}
```

---

## 7. `src/data.ts`

```ts
import {
  Hammer,
  PackageCheck,
  Wrench,
  ShowerHead,
  type LucideIcon,
} from 'lucide-react';

export type Category = {
  id: string;
  name: string;
  tagline: string;
  description: string;
  icon: LucideIcon;
  image: string;
  items: string[];
  accent: string;
};

export const categories: Category[] = [
  {
    id: 'steel',
    name: 'حديد التسليح',
    tagline: 'حديد بجميع المقاسات',
    description:
      'حديد تسليح عالي الجودة بجميع الأقطار والمقاسات، مناسب لجميع الأعمال الإنشائية والسكنية.',
    icon: Hammer,
    image:
      'https://images.pexels.com/photos/1216544/pexels-photo-1216544.jpeg?auto=compress&cs=tinysrgb&w=1200',
    items: ['حديد 8 مم', 'حديد 10 مم', 'حديد 12 مم', 'حديد 14 مم', 'حديد 16 مم', 'حديد 20 مم', 'حديد 25 مم', 'لفات سلك'],
    accent: 'from-brand-500/20 to-brand-700/5',
  },
  {
    id: 'cement',
    name: 'أسمنت ومواد ربط',
    tagline: 'أسمنت وبلوك وجبس',
    description:
      'أسمنت معتمد بمعايير عالية، إضافة إلى البلوك والجبس ومواد الربط المختلفة.',
    icon: PackageCheck,
    image:
      'https://images.pexels.com/photos/833602/pexels-photo-833602.jpeg?auto=compress&cs=tinysrgb&w=1200',
    items: ['أسمنت بورتلاندي', 'أسمنت مقاوم', 'بلوك أحمر', 'بلوك أسمنتي', 'جبس بلاستر', 'جبس مايكرون', 'إسمنت أبيض', 'مواد لاصقة'],
    accent: 'from-sky-500/20 to-sky-700/5',
  },
  {
    id: 'sanitary',
    name: 'أدوات صحية',
    tagline: 'سباكة وتركيبات صحية',
    description:
      'أدوات صحية ولوازم سباكة متنوعة من علامات موثوقة، تضمن أداءً طويل الأمد.',
    icon: ShowerHead,
    image:
      'https://images.pexels.com/photos/6421895/pexels-photo-6421895.jpeg?auto=compress&cs=tinysrgb&w=1200',
    items: ['مواسير PPR', 'مواسير PVC', 'محابس وأكواع', 'خلاطات', 'دشاش', 'سيفونات', 'أنابيب ووصلات'],
    accent: 'from-emerald-500/20 to-emerald-700/5',
  },
  {
    id: 'equipment',
    name: 'معدات بناء',
    tagline: 'عدد وأدوات احترافية',
    description:
      'معدات وأدوات بناء احترافية تلبي احتياجات المقاولين والورش المختلفة.',
    icon: Wrench,
    image:
      'https://images.pexels.com/photos/1797428/pexels-photo-1797428.jpeg?auto=compress&cs=tinysrgb&w=1200',
    items: ['قوالب طوب', 'شاكوشات', 'مثاقب كهربائية', 'مناشير', 'معدات خلط', 'روافع', 'سقالات', 'عربات يد'],
    accent: 'from-amber-500/20 to-amber-700/5',
  },
];

export const phoneNumbers = [
  { number: '711395120', label: 'خط أول' },
  { number: '780200120', label: 'خط ثاني' },
  { number: '714395170', label: 'خط ثالث' },
  { number: '780097750', label: 'خط رابع' },
];

export const locationInfo = {
  region: 'ريمة',
  district: 'الجبين',
  street: 'الشارع العام',
  full: 'ريمة - الجبين - الشارع العام',
  mapQuery: 'Raymah+Al+Jubayn+Yemen',
};
```

---

## 8. `src/lib/supabase.ts`

```ts
export const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
export const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export type Order = {
  id: string;
  customer_name: string;
  phone: string;
  category: string;
  details: string;
  status: string;
  created_at: string;
};
```

---

## 9. `src/components/Navbar.tsx`

```tsx
import { useEffect, useState } from 'react';
import { Menu, X, Phone, MapPin, HardHat } from 'lucide-react';
import { phoneNumbers } from '@/data';

const links = [
  { href: '#home', label: 'الرئيسية' },
  { href: '#categories', label: 'الأقسام' },
  { href: '#order', label: 'اطلب الآن' },
  { href: '#contact', label: 'تواصل معنا' },
];

export default function Navbar() {
  const [open, setOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 24);
    onScroll();
    window.addEventListener('scroll', onScroll);
    return () => window.removeEventListener('scroll', onScroll);
  }, []);

  return (
    <header
      className={`fixed inset-x-0 top-0 z-50 transition-all duration-300 ${
        scrolled
          ? 'bg-ink-950/85 backdrop-blur-xl border-b border-white/10 shadow-lg shadow-black/30'
          : 'bg-transparent'
      }`}
    >
      <nav className="container-x flex h-20 items-center justify-between">
        <a href="#home" className="flex items-center gap-3 group">
          <span className="grid h-12 w-12 place-items-center rounded-xl bg-gradient-to-br from-brand-500 to-brand-700 shadow-lg shadow-brand-500/30 transition-transform group-hover:scale-105">
            <HardHat className="h-6 w-6 text-white" />
          </span>
          <span className="flex flex-col leading-tight">
            <span className="font-display text-lg font-extrabold text-white">ابن مسفر</span>
            <span className="text-xs font-medium text-brand-300">للتجارة - مواد البناء</span>
          </span>
        </a>

        <ul className="hidden items-center gap-1 lg:flex">
          {links.map((l) => (
            <li key={l.href}>
              <a
                href={l.href}
                className="rounded-lg px-4 py-2 text-sm font-bold text-ink-200 transition-colors hover:bg-white/5 hover:text-white"
              >
                {l.label}
              </a>
            </li>
          ))}
        </ul>

        <div className="hidden items-center gap-3 lg:flex">
          <a
            href={`tel:${phoneNumbers[0].number}`}
            className="btn-primary !px-5 !py-2.5 !text-sm"
          >
            <Phone className="h-4 w-4" />
            اتصل بنا
          </a>
        </div>

        <button
          onClick={() => setOpen((v) => !v)}
          className="grid h-11 w-11 place-items-center rounded-lg border border-white/10 bg-white/5 text-white lg:hidden"
          aria-label="القائمة"
        >
          {open ? <X className="h-5 w-5" /> : <Menu className="h-5 w-5" />}
        </button>
      </nav>

      {/* mobile menu */}
      <div
        className={`lg:hidden overflow-hidden border-t border-white/10 bg-ink-950/95 backdrop-blur-xl transition-[max-height,opacity] duration-300 ${
          open ? 'max-h-96 opacity-100' : 'max-h-0 opacity-0'
        }`}
      >
        <div className="container-x flex flex-col gap-1 py-4">
          {links.map((l) => (
            <a
              key={l.href}
              href={l.href}
              onClick={() => setOpen(false)}
              className="rounded-lg px-4 py-3 text-sm font-bold text-ink-200 transition-colors hover:bg-white/5 hover:text-white"
            >
              {l.label}
            </a>
          ))}
          <a
            href={`tel:${phoneNumbers[0].number}`}
            className="btn-primary mt-2 !py-2.5 !text-sm"
          >
            <Phone className="h-4 w-4" />
            اتصل بنا
          </a>
          <a
            href="#contact"
            onClick={() => setOpen(false)}
            className="btn-ghost !py-2.5 !text-sm"
          >
            <MapPin className="h-4 w-4" />
            موقعنا
          </a>
        </div>
      </div>
    </header>
  );
}
```

---

## 10. `src/components/Hero.tsx`

```tsx
import { Phone, MapPin, ChevronDown, ShieldCheck, Truck, BadgeCheck } from 'lucide-react';
import { phoneNumbers, locationInfo } from '@/data';

const stats = [
  { value: '+15', label: 'سنة خبرة' },
  { value: '+2000', label: 'عميل يثق بنا' },
  { value: '4', label: 'أقسام رئيسية' },
];

const badges = [
  { icon: ShieldCheck, text: 'منتجات أصلية معتمدة' },
  { icon: Truck, text: 'توصيل سريع للورش' },
  { icon: BadgeCheck, text: 'أسعار تنافسية' },
];

export default function Hero() {
  return (
    <section id="home" className="relative min-h-screen overflow-hidden pt-20">
      {/* background */}
      <div className="absolute inset-0 -z-10">
        <img
          src="https://images.pexels.com/photos/159306/construction-site-build-construction-work-159306.jpeg?auto=compress&cs=tinysrgb&w=1920"
          alt=""
          className="h-full w-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-l from-ink-950 via-ink-950/85 to-ink-950/40" />
        <div className="absolute inset-0 bg-gradient-to-t from-ink-950 via-transparent to-ink-950/60" />
        <div className="absolute inset-0 blueprint-grid opacity-60" />
      </div>

      <div className="container-x grid min-h-[calc(100vh-5rem)] items-center gap-12 py-16 lg:grid-cols-12">
        <div className="lg:col-span-7 animate-fade-up">
          <span className="inline-flex items-center gap-2 rounded-full border border-brand-500/30 bg-brand-500/10 px-4 py-1.5 text-xs font-bold text-brand-300">
            <span className="h-2 w-2 animate-pulse rounded-full bg-brand-400" />
            {locationInfo.full}
          </span>

          <h1 className="mt-6 font-display text-4xl font-extrabold leading-[1.15] text-white sm:text-5xl lg:text-6xl">
            ابن مسفر للتجارة
            <span className="block bg-gradient-to-l from-brand-400 to-brand-600 bg-clip-text text-transparent">
              مواد البناء والمعدات
            </span>
          </h1>

          <p className="mt-6 max-w-xl text-lg leading-relaxed text-ink-200">
            كل ما يحتاجه مشروعك من مواد البناء في مكان واحد — حديد، أسمنت، أدوات
            صحية، ومعدات احترافية، بجودة موثوقة وأسعار تنافسية.
          </p>

          <div className="mt-8 flex flex-wrap items-center gap-3">
            <a href="#order" className="btn-primary">
              اطلب موادك الآن
            </a>
            <a href="#categories" className="btn-ghost">
              تصفح الأقسام
            </a>
          </div>

          {/* quick call */}
          <div className="mt-8 flex flex-wrap items-center gap-4">
            <span className="text-sm font-bold text-ink-300">اتصل مباشرة:</span>
            {phoneNumbers.slice(0, 2).map((p) => (
              <a
                key={p.number}
                href={`tel:${p.number}`}
                className="inline-flex items-center gap-2 rounded-lg border border-white/10 bg-white/5 px-3 py-1.5 text-sm font-bold text-white transition-colors hover:border-brand-500/40 hover:bg-brand-500/10"
              >
                <Phone className="h-3.5 w-3.5 text-brand-400" />
                {p.number}
              </a>
            ))}
          </div>

          <div className="mt-8 flex flex-wrap gap-x-6 gap-y-3">
            {badges.map((b) => (
              <div key={b.text} className="flex items-center gap-2 text-sm font-medium text-ink-300">
                <b.icon className="h-4 w-4 text-brand-400" />
                {b.text}
              </div>
            ))}
          </div>
        </div>

        {/* stats card */}
        <div className="lg:col-span-5 lg:justify-self-end animate-fade-up [animation-delay:200ms]">
          <div className="card-surface w-full max-w-sm p-6 sm:p-8">
            <div className="grid grid-cols-3 gap-4">
              {stats.map((s) => (
                <div key={s.label} className="text-center">
                  <div className="font-display text-2xl font-extrabold text-brand-400 sm:text-3xl">
                    {s.value}
                  </div>
                  <div className="mt-1 text-xs font-medium text-ink-300">{s.label}</div>
                </div>
              ))}
            </div>

            <div className="my-6 h-px bg-white/10" />

            <div className="flex items-start gap-3">
              <span className="grid h-10 w-10 shrink-0 place-items-center rounded-lg bg-brand-500/15 text-brand-400">
                <MapPin className="h-5 w-5" />
              </span>
              <div>
                <div className="text-sm font-bold text-white">موقع المتجر</div>
                <div className="mt-0.5 text-sm text-ink-300">{locationInfo.full}</div>
              </div>
            </div>

            <a
              href="#contact"
              className="mt-6 flex items-center justify-center gap-2 rounded-xl border border-white/10 bg-white/5 py-3 text-sm font-bold text-white transition-colors hover:border-brand-500/40 hover:bg-brand-500/10"
            >
              عرض على الخريطة
              <ChevronDown className="h-4 w-4" />
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}
```

---

## 11. `src/components/Categories.tsx`

```tsx
import { categories } from '@/data';
import { ArrowLeft, Check } from 'lucide-react';

export default function Categories() {
  return (
    <section id="categories" className="section-pad relative">
      <div className="container-x">
        <div className="mx-auto max-w-2xl text-center">
          <span className="text-sm font-bold uppercase tracking-wider text-brand-400">
            أقسامنا
          </span>
          <h2 className="mt-3 font-display text-3xl font-extrabold text-white sm:text-4xl lg:text-5xl">
            كل ما يلزم مشروعك
          </h2>
          <p className="mt-4 text-base leading-relaxed text-ink-300">
            نوفّر تشكيلة واسعة من مواد البناء والمعدات، موزّعة على أربعة أقسام
            رئيسية تغطي احتياجاتك بالكامل.
          </p>
        </div>

        <div className="mt-14 grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
          {categories.map((cat, i) => (
            <article
              key={cat.id}
              className={`card-surface group relative overflow-hidden p-6 transition-all duration-300 hover:-translate-y-1 hover:border-brand-500/40 hover:bg-ink-900/80 animate-fade-up`}
              style={{ animationDelay: `${i * 90}ms` }}
            >
              <div
                className={`absolute inset-0 -z-10 bg-gradient-to-br ${cat.accent} opacity-0 transition-opacity duration-500 group-hover:opacity-100`}
              />
              <div className="relative h-40 w-full overflow-hidden rounded-xl">
                <img
                  src={cat.image}
                  alt={cat.name}
                  loading="lazy"
                  className="h-full w-full object-cover transition-transform duration-700 group-hover:scale-110"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-ink-950 via-ink-950/30 to-transparent" />
                <span className="absolute bottom-3 right-3 grid h-11 w-11 place-items-center rounded-lg bg-brand-500/90 text-white shadow-lg">
                  <cat.icon className="h-5 w-5" />
                </span>
              </div>

              <h3 className="mt-5 font-display text-xl font-extrabold text-white">
                {cat.name}
              </h3>
              <p className="mt-1 text-xs font-bold text-brand-300">{cat.tagline}</p>
              <p className="mt-3 text-sm leading-relaxed text-ink-300">
                {cat.description}
              </p>

              <ul className="mt-4 flex flex-wrap gap-2">
                {cat.items.slice(0, 4).map((item) => (
                  <li
                    key={item}
                    className="inline-flex items-center gap-1 rounded-md border border-white/10 bg-white/5 px-2 py-1 text-[11px] font-medium text-ink-200"
                  >
                    <Check className="h-3 w-3 text-brand-400" />
                    {item}
                  </li>
                ))}
                <li className="inline-flex items-center rounded-md border border-white/10 bg-white/5 px-2 py-1 text-[11px] font-medium text-ink-400">
                  +{cat.items.length - 4} المزيد
                </li>
              </ul>

              <a
                href="#order"
                className="mt-5 inline-flex items-center gap-1.5 text-sm font-bold text-brand-400 transition-colors hover:text-brand-300"
              >
                اطلب من هذا القسم
                <ArrowLeft className="h-4 w-4" />
              </a>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
```

---

## 12. `src/components/OrderForm.tsx`

```tsx
import { useState, FormEvent } from 'react';
import { categories } from '@/data';
import { supabaseUrl, supabaseAnonKey } from '@/lib/supabase';
import {
  User,
  Phone,
  Package,
  Send,
  CheckCircle2,
  Loader2,
  Hash,
  MessageSquare,
  AlertCircle,
} from 'lucide-react';

type FormState = {
  name: string;
  phone: string;
  category: string;
  details: string;
};

const initial: FormState = { name: '', phone: '', category: '', details: '' };

export default function OrderForm() {
  const [form, setForm] = useState<FormState>(initial);
  const [status, setStatus] = useState<'idle' | 'loading' | 'done' | 'error'>('idle');
  const [errorMsg, setErrorMsg] = useState('');

  const update =
    (key: keyof FormState) =>
    (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) =>
      setForm((f) => ({ ...f, [key]: e.target.value }));

  const onSubmit = async (e: FormEvent) => {
    e.preventDefault();
    if (!form.name || !form.phone || !form.category || !form.details) return;
    setStatus('loading');
    setErrorMsg('');
    try {
      const response = await fetch(`${supabaseUrl}/functions/v1/create-order`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${supabaseAnonKey}`,
          apikey: supabaseAnonKey,
        },
        body: JSON.stringify({
          customer_name: form.name,
          phone: form.phone,
          category: form.category,
          details: form.details,
        }),
      });
      if (!response.ok) {
        let message = `فشل الإرسال (${response.status})`;
        try {
          const errBody = await response.json();
          if (errBody?.error) message = errBody.error;
        } catch { /* ignore parse failure */ }
        throw new Error(message);
      }
      setStatus('done');
    } catch (err) {
      setErrorMsg(err instanceof Error ? err.message : 'حدث خطأ غير متوقع');
      setStatus('error');
    }
  };

  const reset = () => {
    setForm(initial);
    setStatus('idle');
    setErrorMsg('');
  };

  return (
    <section id="order" className="section-pad relative overflow-hidden">
      <div className="absolute inset-0 -z-10 bg-gradient-to-b from-ink-950 via-ink-900/40 to-ink-950" />
      <div className="container-x">
        <div className="grid gap-10 lg:grid-cols-12 lg:gap-16">
          {/* copy */}
          <div className="lg:col-span-5">
            <span className="text-sm font-bold uppercase tracking-wider text-brand-400">
              اطلب الآن
            </span>
            <h2 className="mt-3 font-display text-3xl font-extrabold text-white sm:text-4xl lg:text-5xl">
              سجّل طلبك وسنتواصل معك
            </h2>
            <p className="mt-4 text-base leading-relaxed text-ink-300">
              املأ بياناتك وتفاصيل المواد المطلوبة، وسيقوم فريقنا بتأكيد الطلب
              وتجهيزه في أقرب وقت ممكن.
            </p>

            <ul className="mt-8 space-y-4">
              {[
                { icon: Hash, t: 'رقم الطلب', d: 'يصلك رقم طلب فريد لمتابعة حالته' },
                { icon: Phone, t: 'تأكيد هاتفي', d: 'نتصل بك لتأكيد الكميات والمواصفات' },
                { icon: Package, t: 'تجهيز سريع', d: 'نجهّز طلبك ونوفّر التوصيل للورش' },
              ].map((f) => (
                <li key={f.t} className="flex items-start gap-3">
                  <span className="grid h-10 w-10 shrink-0 place-items-center rounded-lg bg-brand-500/15 text-brand-400">
                    <f.icon className="h-5 w-5" />
                  </span>
                  <div>
                    <div className="text-sm font-bold text-white">{f.t}</div>
                    <div className="mt-0.5 text-sm text-ink-300">{f.d}</div>
                  </div>
                </li>
              ))}
            </ul>
          </div>

          {/* form */}
          <div className="lg:col-span-7">
            <div className="card-surface p-6 sm:p-8">
              {status === 'done' ? (
                <div className="flex flex-col items-center justify-center py-16 text-center animate-fade-in">
                  <span className="grid h-16 w-16 place-items-center rounded-full bg-emerald-500/15 text-emerald-400">
                    <CheckCircle2 className="h-8 w-8" />
                  </span>
                  <h3 className="mt-5 font-display text-2xl font-extrabold text-white">
                    تم استلام طلبك بنجاح
                  </h3>
                  <p className="mt-3 max-w-md text-sm leading-relaxed text-ink-300">
                    شكراً {form.name || 'لك'}، سيتواصل معك فريق ابن مسفر للتجارة على
                    الرقم {form.phone} لتأكيد الطلب وتجهيزه.
                  </p>
                  <button onClick={reset} className="btn-ghost mt-6">
                    إرسال طلب جديد
                  </button>
                </div>
              ) : status === 'error' ? (
                <div className="flex flex-col items-center justify-center py-16 text-center animate-fade-in">
                  <span className="grid h-16 w-16 place-items-center rounded-full bg-red-500/15 text-red-400">
                    <AlertCircle className="h-8 w-8" />
                  </span>
                  <h3 className="mt-5 font-display text-2xl font-extrabold text-white">
                    تعذّر إرسال الطلب
                  </h3>
                  <p className="mt-3 max-w-md text-sm leading-relaxed text-ink-300">
                    {errorMsg || 'حدث خطأ أثناء الإرسال. حاول مرة أخرى.'}
                  </p>
                  <button onClick={() => setStatus('idle')} className="btn-ghost mt-6">
                    المحاولة مرة أخرى
                  </button>
                </div>
              ) : (
                <form onSubmit={onSubmit} className="space-y-5">
                  <div className="grid gap-5 sm:grid-cols-2">
                    <Field
                      label="اسم العميل"
                      icon={<User className="h-4 w-4" />}
                      required
                    >
                      <input
                        type="text"
                        value={form.name}
                        onChange={update('name')}
                        placeholder="اكتب اسمك الكامل"
                        required
                        className="form-input"
                      />
                    </Field>

                    <Field
                      label="رقم الهاتف"
                      icon={<Phone className="h-4 w-4" />}
                      required
                    >
                      <input
                        type="tel"
                        value={form.phone}
                        onChange={update('phone')}
                        placeholder="مثال: 7xxxxxxxx"
                        required
                        className="form-input"
                      />
                    </Field>
                  </div>

                  <Field
                    label="القسم المطلوب"
                    icon={<Package className="h-4 w-4" />}
                    required
                  >
                    <select
                      value={form.category}
                      onChange={update('category')}
                      required
                      className="form-input appearance-none"
                    >
                      <option value="" disabled>
                        اختر القسم
                      </option>
                      {categories.map((c) => (
                        <option key={c.id} value={c.name}>
                          {c.name}
                        </option>
                      ))}
                    </select>
                  </Field>

                  <Field
                    label="تفاصيل المواد المطلوبة"
                    icon={<MessageSquare className="h-4 w-4" />}
                    required
                  >
                    <textarea
                      value={form.details}
                      onChange={update('details')}
                      rows={5}
                      placeholder="اكتب نوع المواد، الكميات، والمقاسات المطلوبة..."
                      required
                      className="form-input resize-none"
                    />
                  </Field>

                  <button
                    type="submit"
                    disabled={status === 'loading'}
                    className="btn-primary w-full !py-3.5 disabled:opacity-70"
                  >
                    {status === 'loading' ? (
                      <>
                        <Loader2 className="h-5 w-5 animate-spin" />
                        جاري الإرسال...
                      </>
                    ) : (
                      <>
                        <Send className="h-5 w-5" />
                        إرسال الطلب
                      </>
                    )}
                  </button>

                  <p className="text-center text-xs text-ink-400">
                    بالضغط على إرسال الطلب، أنت توافق على أن يتواصل معك فريق ابن مسفر
                    للتجارة لتأكيد الطلب.
                  </p>
                </form>
              )}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

function Field({
  label,
  icon,
  required,
  children,
}: {
  label: string;
  icon: React.ReactNode;
  required?: boolean;
  children: React.ReactNode;
}) {
  return (
    <label className="block">
      <span className="mb-2 flex items-center gap-1.5 text-sm font-bold text-ink-100">
        <span className="text-brand-400">{icon}</span>
        {label}
        {required && <span className="text-brand-400">*</span>}
      </span>
      {children}
    </label>
  );
}
```

---

## 13. `src/components/Contact.tsx`

```tsx
import { phoneNumbers, locationInfo } from '@/data';
import { Phone, MapPin, Clock, Navigation, Copy, Check } from 'lucide-react';
import { useState } from 'react';

export default function Contact() {
  const [copied, setCopied] = useState<string | null>(null);

  const copy = (num: string) => {
    navigator.clipboard?.writeText(num);
    setCopied(num);
    setTimeout(() => setCopied(null), 1500);
  };

  return (
    <section id="contact" className="section-pad relative overflow-hidden">
      <div className="absolute inset-0 -z-10 blueprint-grid opacity-40" />
      <div className="container-x">
        <div className="mx-auto max-w-2xl text-center">
          <span className="text-sm font-bold uppercase tracking-wider text-brand-400">
            تواصل معنا
          </span>
          <h2 className="mt-3 font-display text-3xl font-extrabold text-white sm:text-4xl lg:text-5xl">
            أرقامنا وموقعنا
          </h2>
          <p className="mt-4 text-base leading-relaxed text-ink-300">
            نحن في خدمتك على مدار الأسبوع — اتصل أو زرنا في المتجر.
          </p>
        </div>

        <div className="mt-14 grid gap-6 lg:grid-cols-12">
          {/* phone numbers */}
          <div className="lg:col-span-5 space-y-4">
            <div className="card-surface p-6">
              <h3 className="flex items-center gap-2 font-display text-lg font-extrabold text-white">
                <span className="grid h-9 w-9 place-items-center rounded-lg bg-brand-500/15 text-brand-400">
                  <Phone className="h-4 w-4" />
                </span>
                أرقام التواصل
              </h3>
              <p className="mt-2 text-sm text-ink-300">
                اتصل على أي من الأرقام التالية لخدمتك.
              </p>

              <ul className="mt-5 space-y-3">
                {phoneNumbers.map((p, i) => (
                  <li
                    key={p.number}
                    className="group flex items-center justify-between gap-3 rounded-xl border border-white/10 bg-white/5 p-3 transition-colors hover:border-brand-500/40 hover:bg-brand-500/5"
                  >
                    <div className="flex items-center gap-3">
                      <span className="grid h-10 w-10 place-items-center rounded-lg bg-ink-950 text-brand-400 font-display text-sm font-extrabold">
                        {i + 1}
                      </span>
                      <div>
                        <div className="text-[11px] font-medium text-ink-400">
                          {p.label}
                        </div>
                        <a
                          href={`tel:${p.number}`}
                          dir="ltr"
                          className="font-display text-lg font-extrabold tracking-wide text-white"
                        >
                          {p.number}
                        </a>
                      </div>
                    </div>
                    <div className="flex items-center gap-1.5">
                      <a
                        href={`tel:${p.number}`}
                        className="grid h-9 w-9 place-items-center rounded-lg bg-brand-500/15 text-brand-400 transition-colors hover:bg-brand-500 hover:text-white"
                        aria-label="اتصل"
                      >
                        <Phone className="h-4 w-4" />
                      </a>
                      <button
                        onClick={() => copy(p.number)}
                        className="grid h-9 w-9 place-items-center rounded-lg bg-white/5 text-ink-300 transition-colors hover:bg-white/10 hover:text-white"
                        aria-label="نسخ الرقم"
                      >
                        {copied === p.number ? (
                          <Check className="h-4 w-4 text-emerald-400" />
                        ) : (
                          <Copy className="h-4 w-4" />
                        )}
                      </button>
                    </div>
                  </li>
                ))}
              </ul>
            </div>

            <div className="card-surface p-6">
              <h3 className="flex items-center gap-2 font-display text-lg font-extrabold text-white">
                <span className="grid h-9 w-9 place-items-center rounded-lg bg-brand-500/15 text-brand-400">
                  <Clock className="h-4 w-4" />
                </span>
                أوقات العمل
              </h3>
              <ul className="mt-4 space-y-2 text-sm text-ink-200">
                <li className="flex items-center justify-between">
                  <span>السبت - الخميس</span>
                  <span className="font-bold text-white">7:00 ص - 8:00 م</span>
                </li>
                <li className="flex items-center justify-between">
                  <span>الجمعة</span>
                  <span className="font-bold text-white">4:00 م - 8:00 م</span>
                </li>
              </ul>
            </div>
          </div>

          {/* location */}
          <div className="lg:col-span-7">
            <div className="card-surface overflow-hidden">
              <div className="p-6">
                <h3 className="flex items-center gap-2 font-display text-lg font-extrabold text-white">
                  <span className="grid h-9 w-9 place-items-center rounded-lg bg-brand-500/15 text-brand-400">
                    <MapPin className="h-4 w-4" />
                  </span>
                  الموقع
                </h3>
                <div className="mt-4 flex flex-wrap items-center gap-2 text-sm">
                  <span className="rounded-md bg-brand-500/15 px-3 py-1 font-bold text-brand-300">
                    {locationInfo.region}
                  </span>
                  <span className="text-ink-400">/</span>
                  <span className="rounded-md bg-brand-500/15 px-3 py-1 font-bold text-brand-300">
                    {locationInfo.district}
                  </span>
                  <span className="text-ink-400">/</span>
                  <span className="rounded-md bg-brand-500/15 px-3 py-1 font-bold text-brand-300">
                    {locationInfo.street}
                  </span>
                </div>
                <p className="mt-4 text-sm leading-relaxed text-ink-300">
                  تجدنا على {locationInfo.full} — موقع مركزي يسهل الوصول إليه من جميع
                  المناطق المجاورة.
                </p>
                <a
                  href={`https://www.google.com/maps/search/?api=1&query=${locationInfo.mapQuery}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="btn-primary mt-5 !py-2.5 !text-sm"
                >
                  <Navigation className="h-4 w-4" />
                  الاتجاهات إلى المتجر
                </a>
              </div>

              <div className="relative h-72 w-full sm:h-80">
                <iframe
                  title="موقع ابن مسفر للتجارة"
                  className="h-full w-full grayscale-[0.3] contrast-110"
                  style={{ border: 0 }}
                  loading="lazy"
                  allowFullScreen
                  referrerPolicy="no-referrer-when-downgrade"
                  src={`https://www.google.com/maps?q=${locationInfo.mapQuery}&output=embed`}
                />
                <div className="pointer-events-none absolute inset-0 ring-1 ring-inset ring-white/10" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
```

---

## 14. `src/components/Footer.tsx`

```tsx
import { HardHat, Phone, MapPin } from 'lucide-react';
import { phoneNumbers, locationInfo } from '@/data';

export default function Footer() {
  return (
    <footer className="border-t border-white/10 bg-ink-950">
      <div className="container-x py-12">
        <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
          <div>
            <div className="flex items-center gap-3">
              <span className="grid h-11 w-11 place-items-center rounded-xl bg-gradient-to-br from-brand-500 to-brand-700">
                <HardHat className="h-5 w-5 text-white" />
              </span>
              <div>
                <div className="font-display text-base font-extrabold text-white">
                  ابن مسفر للتجارة
                </div>
                <div className="text-xs text-brand-300">مواد البناء والمعدات</div>
              </div>
            </div>
            <p className="mt-4 max-w-xs text-sm leading-relaxed text-ink-400">
              وجهتك الموثوقة لكل ما يحتاجه مشروعك من مواد البناء، بجودة عالية
              وأسعار تنافسية.
            </p>
          </div>

          <div>
            <h4 className="font-display text-sm font-extrabold text-white">
              تواصل معنا
            </h4>
            <ul className="mt-4 space-y-2 text-sm text-ink-300">
              {phoneNumbers.map((p) => (
                <li key={p.number}>
                  <a
                    href={`tel:${p.number}`}
                    className="inline-flex items-center gap-2 transition-colors hover:text-brand-300"
                  >
                    <Phone className="h-3.5 w-3.5 text-brand-400" />
                    <span dir="ltr">{p.number}</span>
                  </a>
                </li>
              ))}
            </ul>
          </div>

          <div>
            <h4 className="font-display text-sm font-extrabold text-white">
              الموقع
            </h4>
            <p className="mt-4 flex items-start gap-2 text-sm text-ink-300">
              <MapPin className="mt-0.5 h-4 w-4 shrink-0 text-brand-400" />
              {locationInfo.full}
            </p>
          </div>
        </div>

        <div className="mt-10 flex flex-col items-center justify-between gap-3 border-t border-white/10 pt-6 text-center sm:flex-row sm:text-right">
          <p className="text-xs text-ink-400">
            © {new Date().getFullYear()} ابن مسفر للتجارة. جميع الحقوق محفوظة.
          </p>
          <p className="text-xs text-ink-500">مواد البناء · المعدات · الأدوات الصحية</p>
        </div>
      </div>
    </footer>
  );
}
```

---

## 15. `supabase/functions/create-order/index.ts` (Edge Function)

```ts
import { createClient } from 'npm:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const body = await req.json();
    const { customer_name, phone, category, details } = body ?? {};

    if (
      typeof customer_name !== 'string' || !customer_name.trim() ||
      typeof phone !== 'string' || !phone.trim() ||
      typeof category !== 'string' || !category.trim() ||
      typeof details !== 'string' || !details.trim()
    ) {
      return new Response(
        JSON.stringify({ error: 'بيانات الطلب غير مكتملة أو غير صالحة' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
      );
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    const { data, error } = await supabase
      .from('orders')
      .insert({
        customer_name: customer_name.trim(),
        phone: phone.trim(),
        category: category.trim(),
        details: details.trim(),
      })
      .select('id')
      .single();

    if (error) throw error;

    return new Response(
      JSON.stringify({ ok: true, id: data.id }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    );
  } catch (err) {
    return new Response(
      JSON.stringify({ error: err instanceof Error ? err.message : 'خطأ غير متوقع' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } },
    );
  }
});
```

---

## 16. SQL — إنشاء جدول الطلبات

```sql
CREATE TABLE IF NOT EXISTS orders (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_name text NOT NULL,
  phone text NOT NULL,
  category text NOT NULL,
  details text NOT NULL,
  status text NOT NULL DEFAULT 'new',
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

CREATE INDEX IF NOT EXISTS idx_orders_created_at ON orders (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_orders_status ON orders (status);
```

> ملاحظة: تم إزالة جميع سياسات RLS العامة لضمان الأمان. إنشاء الطلبات يتم حصرياً عبر الـ Edge Function بصلاحيات الموظفين.

---

## ملخص الملفات

| الملف | الوصف |
|------|--------|
| `index.html` | الصفحة الرئيسية + الخطوط العربية |
| `package.json` | حزم المشروع |
| `tailwind.config.js` | ألوان وخطوط وحركات Tailwind |
| `src/main.tsx` | نقطة دخول React |
| `src/index.css` | أنماط Tailwind + مكونات مخصصة |
| `src/App.tsx` | التطبيق الرئيسي يجمع كل المكونات |
| `src/data.ts` | بيانات الأقسام وأرقام الهواتف والموقع |
| `src/lib/supabase.ts` | إعدادات الاتصال بقاعدة البيانات |
| `src/components/Navbar.tsx` | شريط التنقل العلوي |
| `src/components/Hero.tsx` | القسم الرئيسي مع الصورة والإحصائيات |
| `src/components/Categories.tsx` | عرض الأقسام الأربعة |
| `src/components/OrderForm.tsx` | نموذج الطلب (يرسل للـ Edge Function) |
| `src/components/Contact.tsx` | أرقام التواصل + الخريطة |
| `src/components/Footer.tsx` | تذييل الصفحة |
| `supabase/functions/create-order/index.ts` | دالة الخادم لحفظ الطلبات |
