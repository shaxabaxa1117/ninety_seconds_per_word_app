import 'package:flutter/material.dart';




//!For now there is going to be only list of words that are added but we must add deck components in the near future 

class WordListPage extends StatelessWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Placeholder();
      //ListView.separated(
    //       padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 22),
    //       itemBuilder: (context, i) {
    //         return Card(
    //           child: ListTile( //! элементы
    //             title: Text(
    //               allNotes[i].title.toString(),
    //               style: AppStyle.fontStyle.copyWith(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.w600,
    //                 color: AppColors.purple,
    //               ),
    //             ),
    //             subtitle: Text(
    //               allNotes[i].text.toString(),
    //               style: AppStyle.fontStyle.copyWith(
    //                 fontSize: 14,
    //                 color: AppColors.black,
    //               ),
    //             ),
    //             trailing: SizedBox(
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   IconButton(
    //                     onPressed: () {
    //                       Navigator.pushNamed(context, '/edit_note', arguments: i); //! дал аргумент
    //                       model.setControllers(i);
    //                     },
    //                     icon: const Icon(
    //                       Icons.edit_outlined,
    //                       color: AppColors.iconsColor,
    //                     ),
    //                   ),
    //                   IconButton(
    //                     onPressed: () {
    //                       model.deleteNote(i);
    //                     },
    //                     icon: const Icon(
    //                       Icons.delete_outline,
    //                       color: AppColors.iconsColor,
    //                     ),
    //                   ),
    //                   IconButton(
    //                     onPressed: () {
    //                       model.onCheck(i, allNotes);
    //                     },
    //                     icon: Icon(
    //                       Icons.check_circle_outline,
    //                       color: allNotes[i].isChecked ? Colors.green :AppColors.iconsColor,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //       separatorBuilder: (context, i) => const SizedBox(height: 20),
    //       itemCount:allNotes.length, 
    //     );;
  }
}