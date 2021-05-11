import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/models/product.dart';

// ignore: non_constant_identifier_names
final MOCK_BRAND = Brand(id: '1', name: '브랜드', thumbnail: '');
// ignore: non_constant_identifier_names
final MOCK_CATEGORY = Category(id: '1', name: '찌개', thumbnail: '');

class ProductRepo {
  final List<Product> _mockData = [
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
    Product(
        url:
            "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263949782?NaPm=ct%3Dkojn8pns%7Cci%3D1d036404070ebad9fa70bc23b97b8ccd6bdbb81c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Db8e33bcd6596ea2d680418297ed7f56690c8eca7",
        price: 1234567,
        id: '1',
        name: '부대찌개 들썩들썩 떠들썩 와글와글 우르르 쾅쾅 모두모두모두모두 모여어라 하나둘셋 하나둘셋 나아라로',
        thumbnail: 'assets/product_example.png',
        category: MOCK_CATEGORY,
        brand: MOCK_BRAND),
  ];

  Future<List<Product>> list({Category? category, Brand? brand}) async {
    return _mockData;
  }
}
