package com.company;
import java.io.*;
import java.util.Scanner;

class Thread1 extends Thread {
    private void swap(int[] array, int ind1, int ind2) {
        int tmp = array[ind1];
        array[ind1] = array[ind2];
        array[ind2] = tmp;
    }
    public void run() {
        System.out.println("Початок потоку 1"+'\n');
        Scanner input = new Scanner(System.in);
        System.out.println("Введіть довжину масиву:");
        int size = input.nextInt();
        int B[] = new int[size];
        System.out.println("Введіть елементи масивуу");
        for (int i = 0; i < size; i++) {
            B[i] = input.nextInt(); // заповнюємо масив
        }

        boolean needIteration = true;
        while (needIteration) {
            needIteration = false;
            for (int i = 1; i < B.length; i++) {
                if (B[i] < B[i - 1]) {
                    swap(B, i, i-1);
                    needIteration = true;
                }
            }
        }
        try{
            sleep(10);
        }
        catch (InterruptedException ex){
            ex.printStackTrace();
        }
        System.out.println("Відсортований масив:");
        for (int i = 0; i < size; i++) {
            System.out.print (" " + B[i]); // виводимо на екран відсортований масив
        }
        System.out.println();

        System.out.println("Кінець потоку 1"+'\n');
    }
}
class Thread2 extends Thread
{
    public void run()
    {
        System.out.println("Початок потоку 2"+'\n');
        Scanner in = new Scanner(System.in);
        int size = 3;
        int[] A = new int[size];
        int[] B = {2, 2, 1};

        int[][] MO = {
                {1,2,3},
                {2,3,1},
                {5,1,1}
        };
        int[][] MN = {
                {1,3,1},
                {5,7,1},
                {6,0,2}
        };

        int[][] MZ = {
                {2,8,1},
                {6,3,4},
                {0,1,7}
        };

        for(int i =0;i<size;i++)
        {
            for(int j =0;j<size;j++)
            {
                MO[i][j] = MO[i][j]-MN[i][j]+MZ[i][j];
            }
        }
        for(int i =0;i<size;i++)
        {
            for(int j =0;j<size;j++)
            {
                A[i]+=MO[i][j]*B[j];
            }
        }
        System.out.println("Вектор А: ");
        for (int i = 0; i < size; i++) {
            System.out.print (" " + A[i]); // виводимо на екран
        }
        try{
            sleep(10);
        }
        catch (InterruptedException ex){
            ex.printStackTrace();
        }
        System.out.println("\n" + "Кінець потоку 2");
    }
}
class Thread3 extends Thread {
    public void run(){
        System.out.println(" Початок потоку 3");
        int[][] MC = new int[3][3];
        int[][] MV = new int[3][3];
        int[][] MS = new int[3][3];
        int[][] MT = new int[3][3];
        int[][] temp = new int[3][3];
        Scanner scanner1 = null;
        Scanner scanner2 = null;
        Scanner scanner3 = null;
        int size = 3;
        try {
            scanner1 = new Scanner(new File("D:\\MC.txt"));  for(int i = 0; i < size; i++){
                for (int j = 0; j < size; j++) {
                    int k = scanner1.nextInt();
                    MV[i][j] = k;
                }
            }
        }
        catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            scanner2 = new Scanner(new File("D:\\MV.txt"));  for(int i = 0; i < size; i++){
                for (int j = 0; j < size; j++) {
                    int k = scanner2.nextInt();
                    MC[i][j] = k;
                }
            }
        }
        catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            scanner3 = new Scanner(new File("D:\\MS.txt"));  for(int i = 0; i < size; i++){
                for (int j = 0; j < size; j++) {
                    int k = scanner3.nextInt();
                    MS[i][j] = k;
                }
            }
        }
        catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                for (int k = 0; k < size; k++) {
                    temp[i][j] += MC[i][k] * MV[k][j];
                }
            }
        }
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                for (int k = 0; k < size; k++) {
                    MT[i][j] += temp[i][k] * MS[k][j];
                }
            }
        }
        System.out.println("Матриця MT: ");
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                System.out.print(MT[i][j] + "\t");
            }
            System.out.println();
        }
        try{
            sleep(10);
        }
        catch (InterruptedException ex){
            ex.printStackTrace();
        }
        System.out.println("Кінець потоку 3");
    }
}
public class Main {
    public static void main(String [] args) throws InterruptedException {
        Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
        System.out.println("Початок головного потоку");
        System.out.println("Пріорітет головного потоку = " + Thread.currentThread().getPriority());
        Thread1 first = new Thread1();
        first.setPriority(4);

        Thread2 second = new Thread2();
        second.setPriority(2);

        Thread3 thirth = new Thread3();
        thirth.setPriority(5);
        System.out.println("Пріорітет потоку 1 = " + first.getPriority());
        first.start();
        first.join();

        System.out.println("Пріорітет потоку 2 = " + second.getPriority());
        second.start();
        second.join();
        System.out.println("Пріорітет потоку 3 = " + thirth.getPriority());

        thirth.start();
        thirth.join();

        System.out.println("Кінець головного потоку");
    }
}
