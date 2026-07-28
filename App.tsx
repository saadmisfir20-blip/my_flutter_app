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
