import 'package:shoppingmall_application/shoppingmall_application.dart' as shoppingmall_application;
import 'dart:io';

// 아래의 기능이 들어있는 콘솔 프로그램 만들기
// - 판매하는 상품 목록을 볼 수 있는 기능
// - 구매자가 구매하고 싶은 상품들을 장바구니에 담을 수 있는 기능
// - 구매자가 장바구니에 담은 상품들의 총 가격을 볼 수 있는 기능

class Product { // 상품을 정의하기 위한 Product 클래스
    String productname = "";
    int productprice = 0;

    Product(this.productname, this.productprice); // 생성자
}

class ShoppingMall { // 쇼핑몰을 정의하기 위한 ShoppingMall 클래스
  Map<String, int> productMap = { // 판매하는 상품:가격
    '셔츠':45000,
    '양말':5000,
    '원피스':30000,
    '반팔티':35000,
    '반바지':38000
  };
  
  int totalprice = 0; //장바구니에 담은 상품들의 총 가격
  
  // 상품 이름과 가격을 리스트화
  late var productnamelist = productMap.keys.toList();
  late var productpricelist = productMap.values.toList();

  // 상품 목록을 출력하는 메서드
  void showProducts(num) {
   print('[$num] 상품 목록 보기');

   String printlist; // 상품 목록 출력 변수

    for (var i = 0; i < productMap.length; i++) {
      //productpricelist가 int 타입이라 오류 발생 -> to.String() 사용해서 해결
      //printlist = productlist[i]+' / '+productpricelist[i]+'원';
      printlist = productnamelist[i]+' | '+productpricelist[i].toString()+'원';
      print(printlist);
    }
  }

  // 상품을 장바구니에 담는 메서드
  void addToCart(num) {
    print('[$num] 장바구니에 담기');
    
    String inputname = ""; // 입력 받을 상품 이름 변수
    int inputcount = 0; // 입력 받을 상품 개수 변수
    int checkindex; // 입력 받은 상품 이름의 인덱스 확인 변수
    int indexprice; // 확인한 인덱스로 입력 받은 상품의 가격 확인 변수

    try {
      print('상품 이름을 입력하세요 : ');
      inputname = stdin.readLineSync()!;
      print('상품 개수를 입력하세요 : ');
      inputcount = int.parse(stdin.readLineSync()!);

      /*
        입력한 상품의 이름이 상품 목록에 있지 않거나 상품의 개수가 0 이하의 값이면 장바구니에 담기지 않습니다.
        상품 목록에 없는 상품의 이름을 입력한 경우 `입력값이 올바르지 않아요 !` 를 출력합니다.
        상품의 개수를 숫자 형태로 입력하지 않은 경우 `입력값이 올바르지 않아요 !` 를 출력합니다.
        입력한 상품의 개수가 0 이하의 수인 경우 `0개보다 많은 개수의 상품만 담을 수 있어요 !` 를 출력합니다.
        입력한 상품의 이름과 상품의 개수가 올바른 값이면 장바구니에 담깁니다.
        이 경우 `장바구니에 상품이 담겼어요 !` 를 출력합니다.
      */

      //if (inputname==ShoppingMall().productMap.containsKey(inputname)) {
      //print(ShoppingMall().productMap.containsKey(inputname));
      if (ShoppingMall().productMap.containsKey(inputname)==true) {
          if (inputcount.runtimeType==int && inputcount > 0) {
            checkindex = productnamelist.indexOf(inputname); // 입력 받은 상품 이름의 인덱스 확인
            indexprice = productpricelist[checkindex]; // 확인한 인덱스로 입력 받은 상품의 가격 확인 
            totalprice += inputcount*indexprice; // 입력 받은 상품 개수 * 상품 가격
            throw('장바구니에 상품이 담겼어요');
          } else if (inputcount.runtimeType!=int) {
            throw ('상품 개수 입력값이 올바르지 않아요');
          } else if (inputcount <= 0) {
            throw ('0개보다 많은 개수의 상품만 담을 수 있어요');
          }
      } else if (ShoppingMall().productMap.containsKey(inputname)==false) {
        throw ('상품 이름 입력값이 올바르지 않아요');
      }
      
    } catch (e) {
      print(e);
    }
  }

  // 장바구니에 담은 상품의 총 가격을 출력하는 메서드
  void showTotal(num) {
    print('[$num] 장바구니에 담긴 상품의 총 가격 보기');
    print('장바구니에 $totalprice원 어치를 담으셨네요!');
  }

  // 장바구니 초기화하는 메서드
  void removeCart(num) {
    if(totalprice>0) {
        totalprice = 0;
        print('장바구니가 초기화 됐습니다.');
    } else if(totalprice==0){
        print('이미 장바구니가 비어있습니다.');
    } 
  }
}

void main() {
bool start = true;
while (start==true) {
  print(
    '------------------------------------------------------------------------------------');
  print(
    '[1] 상품 목록 보기 | [2] 장바구니에 담기 | [3] 장바구니에 담긴 상품의 총 가격 보기 | [4] 프로그램 종료 ');
  print(
    '------------------------------------------------------------------------------------');

  int choose = int.parse(stdin.readLineSync()!); // 입력받기

  if(choose == 1) {
    ShoppingMall().showProducts(choose);
  } else if(choose == 2) {
    ShoppingMall().addToCart(choose);
  } else if(choose == 3) {
    ShoppingMall().showTotal(choose);
  } else if(choose == 4) {
    print('정말 종료하시겠습니까?');
    choose = int.parse(stdin.readLineSync()!);
      if(choose == 5) { // 쇼핑몰 프로그램을 종료
      print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
      start = false;
      break;
      } else if(choose != 5) {
      print('종료하지 않습니다.');
      }
  } else if(choose == 6) {
    print('장바구니를 초기화합니다.');
    ShoppingMall().removeCart(choose);
  } else if(choose<1 || choose>6) {
    print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ...');
  }
}
}
