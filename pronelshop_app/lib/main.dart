import 'package:flutter/material.dart';

void main() {
  runApp(const ProNelShopApp());
}

class ProNelShopApp extends StatelessWidget {
  const ProNelShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProNelShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final List<Widget> _tabs = const [
    HomeScreen(),
    SearchScreen(),
    ProductsScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_index],
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: _index,
        onDestinationSelected: (v) => setState(() => _index = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), selectedIcon: Icon(Icons.shopping_bag), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), selectedIcon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}

/* ----------------------------- DATA MODELS ----------------------------- */

class Product {
  final String name;
  final String brand;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviews;
  final String tag; // e.g., "SALE", "NEW"
  final IconData icon; // simple icon "image"

  const Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviews,
    required this.tag,
    required this.icon,
  });
}

const _categories = [
  ('Phones', Icons.smartphone),
  ('Accessories', Icons.headphones),
  ('Computers', Icons.laptop),
  ('Gaming', Icons.sports_esports),
  ('Repairs', Icons.build),
];

const _products = [
  Product(
    name: 'Galaxy A-Series',
    brand: 'Samsung',
    price: 2499,
    oldPrice: 2999,
    rating: 4.6,
    reviews: 214,
    tag: 'SALE',
    icon: Icons.smartphone,
  ),
  Product(
    name: 'iPhone Case Pro',
    brand: 'ProNel',
    price: 149,
    oldPrice: 199,
    rating: 4.4,
    reviews: 88,
    tag: 'HOT',
    icon: Icons.shield,
  ),
  Product(
    name: 'Wireless Earbuds',
    brand: 'SoundX',
    price: 399,
    oldPrice: 499,
    rating: 4.5,
    reviews: 132,
    tag: 'NEW',
    icon: Icons.headphones,
  ),
  Product(
    name: 'Fast Charger 25W',
    brand: 'ChargePro',
    price: 179,
    oldPrice: 229,
    rating: 4.3,
    reviews: 61,
    tag: 'SALE',
    icon: Icons.bolt,
  ),
  Product(
    name: 'Laptop Sleeve',
    brand: 'UrbanTech',
    price: 229,
    oldPrice: 289,
    rating: 4.2,
    reviews: 44,
    tag: 'NEW',
    icon: Icons.laptop,
  ),
  Product(
    name: 'Screen Protector',
    brand: 'ClearView',
    price: 79,
    oldPrice: 99,
    rating: 4.1,
    reviews: 39,
    tag: 'HOT',
    icon: Icons.phone_android,
  ),
];

/* ----------------------------- HOME SCREEN ----------------------------- */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cartCount = 2;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7FB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('ProNelShop', style: TextStyle(fontWeight: FontWeight.w800)),
              SizedBox(height: 2),
              Text('Shopping at its best', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
          actions: [
            IconButton(
              tooltip: 'Notifications',
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    tooltip: 'Cart',
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  if (cartCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: cs.primary,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '$cartCount',
                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          children: [
            _SearchBar(
              onChanged: (_) {},
              onFilterTap: () {},
            ),
            const SizedBox(height: 14),

            _PromoBanner(
              title: 'Big Sale 🔥',
              subtitle: 'Up to 50% OFF on accessories',
              buttonText: 'Shop deals',
              onTap: () {},
            ),
            const SizedBox(height: 18),

            _SectionHeader(
              title: 'Categories',
              actionText: 'See all',
              onAction: () {},
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 88,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final item = _categories[i];
                  return _CategoryChip(label: item.$1, icon: item.$2, onTap: () {});
                },
              ),
            ),

            const SizedBox(height: 18),
            _SectionHeader(
              title: 'Popular products',
              actionText: 'View all',
              onAction: () {},
            ),
            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, i) {
                final p = _products[i];
                return _ProductCard(
                  product: p,
                  onAdd: () => setState(() => cartCount++),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* ----------------------------- SEARCH/PRODUCTS/CART/ACCOUNT ----------------------------- */

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Search')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _SearchBar(onChanged: (_) {}, onFilterTap: () {}),
              const SizedBox(height: 18),
              const Expanded(
                child: Center(
                  child: Text(
                    'Type to search products…',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: _products.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final p = _products[i];
            return _ProductRow(product: p, onAdd: () {});
          },
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _CartItemTile(
                title: _products[0].name,
                subtitle: '1 item',
                price: _products[0].price,
                icon: _products[0].icon,
              ),
              const SizedBox(height: 10),
              _CartItemTile(
                title: _products[2].name,
                subtitle: '1 item',
                price: _products[2].price,
                icon: _products[2].icon,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    _SummaryRow(label: 'Subtotal', value: 'R ${( _products[0].price + _products[2].price ).toStringAsFixed(0)}'),
                    const SizedBox(height: 8),
                    const _SummaryRow(label: 'Delivery', value: 'R 60'),
                    const Divider(height: 22),
                    _SummaryRow(
                      label: 'Total',
                      value: 'R ${( _products[0].price + _products[2].price + 60 ).toStringAsFixed(0)}',
                      bold: true,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cs.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {},
                        child: const Text('Checkout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Account')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: cs.primary.withOpacity(0.12),
                    child: Icon(Icons.person, color: cs.primary),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Guest user', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                        SizedBox(height: 3),
                        Text('Sign in later (Email/Password)', style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _AccountTile(icon: Icons.receipt_long, title: 'Orders', onTap: () {}),
            _AccountTile(icon: Icons.location_on_outlined, title: 'Addresses', onTap: () {}),
            _AccountTile(icon: Icons.support_agent, title: 'Support', onTap: () {}),
            _AccountTile(icon: Icons.settings_outlined, title: 'Settings', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

/* ----------------------------- UI WIDGETS ----------------------------- */

class _SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;

  const _SearchBar({required this.onChanged, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'Search products…',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onFilterTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: cs.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.tune, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const _PromoBanner({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: [cs.primary, cs.primary.withOpacity(0.75)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(subtitle, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(buttonText, style: TextStyle(color: cs.primary, fontWeight: FontWeight.w800)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Icon(Icons.local_offer, color: Colors.white, size: 34),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onAction;

  const _SectionHeader({required this.title, required this.actionText, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
        const Spacer(),
        TextButton(onPressed: onAction, child: Text(actionText)),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryChip({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 118,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: cs.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: cs.primary),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const _ProductCard({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Image" area
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(product.icon, size: 48, color: cs.primary),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: _TagChip(text: product.tag),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Text(
              product.brand,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 2, 12, 0),
            child: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.w900),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: Row(
              children: [
                Icon(Icons.star, size: 16, color: cs.primary),
                const SizedBox(width: 4),
                Text('${product.rating}', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
                const SizedBox(width: 6),
                Text('(${product.reviews})', style: const TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('R ${product.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900)),
                      Text(
                        'R ${product.oldPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: cs.primary,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;

  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const _ProductRow({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F4FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: Icon(product.icon, color: cs.primary)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.w900)),
                const SizedBox(height: 3),
                Text(product.brand, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 6),
                Text('R ${product.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          IconButton(
            onPressed: onAdd,
            icon: Icon(Icons.add_circle, color: cs.primary),
          ),
        ],
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final double price;
  final IconData icon;

  const _CartItemTile({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: cs.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: cs.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
                const SizedBox(height: 3),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Text('R ${price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryRow({required this.label, required this.value, this.bold = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
      fontSize: bold ? 16 : 14,
    );

    return Row(
      children: [
        Text(label, style: TextStyle(color: Colors.black54, fontWeight: style.fontWeight, fontSize: style.fontSize)),
        const Spacer(),
        Text(value, style: style),
      ],
    );
  }
}

class _AccountTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AccountTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w800))),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
