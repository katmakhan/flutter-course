import 'package:flutter/material.dart';

Container noResultFound(BuildContext context, String heading) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          heading,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: const Color(0xff343c47).withOpacity(0.6),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "The following query resulted in zero result, Please check again after sometime. If you still facing the issue, kindly contact the admin \n\n email: btechtraders18@gmail.com",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: const Color(0xff1c1c1c).withOpacity(0.3),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Container noResultFoundNoButton(BuildContext context, String heading) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          heading,
          style: TextStyle(
              fontSize: 16,
              color: const Color(0xff343c47).withOpacity(0.6),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "The following query resulted in zero result, Please check again after sometime. If you still facing the issue, kindly contact the admin \n\n email: btechtraders18@gmail.com",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: const Color(0xff1c1c1c).withOpacity(0.3),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // InkWell(
        //   onTap: () => {
        //     // Navigator.pop(context)
        //   },
        //   child: Container(
        //     height: 50,
        //     margin: EdgeInsets.fromLTRB(0, 20, 0, 16),
        //     decoration: BoxDecoration(
        //       color: primaryColor,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Center(
        //       child: Text("Ok",
        //           style: TextStyle(
        //               fontFamily: 'Poppins',
        //               fontSize: 14,
        //               color: Color(0xFFFFFFFF),
        //               fontWeight: FontWeight.w500)),
        //     ),
        //   ),
        // )
      ],
    ),
  );
}
