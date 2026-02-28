<img width="427" height="881" alt="image" src="https://github.com/user-attachments/assets/f072b1aa-8797-4e72-ab78-d06612cb437e" />
<img width="430" height="891" alt="image" src="https://github.com/user-attachments/assets/bcd63445-ccd3-4b71-99ca-3bfe1bcc2495" />


<img width="452" height="876" alt="image" src="https://github.com/user-attachments/assets/c866a9e3-9ca4-48ad-a8fb-0f6c6ae4d756" />
<img width="438" height="861" alt="image" src="https://github.com/user-attachments/assets/f249e427-c02e-4e92-accd-5f0a0ce8a434" />

📄 README – Scroll & Swipe Implementation
1️⃣ How Horizontal Swipe Was Implemented

The horizontal swipe (category selector: All, men’s clothing, jewelery, etc.) was implemented using:

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: categories.map((category) {
      return CategoryChip(category: category);
    }).toList(),
  ),
)
Why This Approach?

SingleChildScrollView with Axis.horizontal allows smooth left-right swiping.

Row keeps items in a single horizontal line.

Lightweight and efficient for a small number of categories.

No need for ListView.builder since the dataset is small and fixed.

2️⃣ Who Owns the Vertical Scroll and Why?

The vertical scroll is owned by the main ListView that displays products.

Example:

Expanded(
  child: ListView.builder(
    itemCount: products.length,
    itemBuilder: (context, index) {
      return ProductCard(product: products[index]);
    },
  ),
)
Why the Product List Owns the Vertical Scroll?

The product list is the largest and dynamic content.

It may grow infinitely (API pagination).

ListView.builder is memory efficient.

Prevents nested vertical scroll conflicts.

Keeps scroll physics predictable and smooth.

The top banner and horizontal categories are static, so they are placed above the Expanded(ListView).

3️⃣ Scroll Architecture Overview
Column
 ├── Banner Image (Fixed)
 ├── Horizontal Category Scroll (SingleChildScrollView - Horizontal)
 └── Expanded
      └── ListView.builder (Vertical Scroll Owner)

This avoids:

❌ Nested vertical ListView inside SingleChildScrollView

❌ Unbounded height errors

❌ Scroll physics conflicts

4️⃣ Trade-offs & Limitations
✅ Pros

Clean separation of scroll directions.

No nested vertical scrolling.

Good performance for product lists.

