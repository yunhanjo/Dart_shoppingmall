import 'dart:io';

// 아래의 기능이 들어있는 콘솔 프로그램 만들기
// - 판매하는 상품 목록을 볼 수 있는 기능
// - 구매자가 구매하고 싶은 상품들을 장바구니에 담을 수 있는 기능
// - 구매자가 장바구니에 담은 상품들의 총 가격을 볼 수 있는 기능

class Product {
  List productname = [
    //판매하는 상품 목록 (List<Product>) map key:value
    '셔츠',
    '원피스',
    '반팔티',
    '반바지',
    '양말',
  ];
  int price = 0;
}

class ShoppingMall extends Product {
  List<String> Product = [
    //판매하는 상품 목록 (List<Product>) 인덱스반복문
    '셔츠',
    '원피스',
    '반팔티',
    '반바지',
    '양말',
  ];
  int sumprice = 0; //장바구니에 담은 상품들의 총 가격 (int)

  ShoppingMall(this.Product, this.sumprice);

  //상품 목록을 출력하는 메서드
  void showProducts() {
    print('쇼핑리스트 : $Product');
  }

  //상품을 장바구니에 담는 메서드
  void addToCart() {
    print('쇼핑리스트 : $Product');
  }

  //장바구니에 담은 상품의 총 가격을 출력하는 메서드
  void showTotal() {
    print('쇼핑리스트 : $Product');
  }
}

void main() {
  print(
    '------------------------------------------------------------------------------------');
  print(
    '[1] 상품 목록 보기 | [2] 장바구니에 담기 | [3] 장바구니에 담긴 상품의 총 가격 보기 | [4] 프로그램 종료 ');
  print(
    '------------------------------------------------------------------------------------');

print('숫자를 입력하세요 : ');
String? input = stdin.readLineSync();
int num = int.parse(input!);
print('입력한 숫자는 $num입니다.');

  int choose = int.parse(stdin.readLineSync()!);
  print('$choose번을 선택하셨습니다.');
  //int choose = int.parse(stdin.readByteSync())
}
