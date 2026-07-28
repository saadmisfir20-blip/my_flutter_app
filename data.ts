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
