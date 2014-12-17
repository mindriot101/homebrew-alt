class Jktld < Formula
  homepage "http://www.astro.keele.ac.uk/jkt/codes/jktld.html"
  url "http://www.astro.keele.ac.uk/jkt/codes/jktld/jktld-v3.tgz"
  sha1 "8c741945710de37722e5c86c9e3ba7ba9f73d1f0"

  depends_on :fortran

  patch :DATA

  def install
    mkdir "#{name}" do
      cp Dir.glob('../JKTLD*.dat'), '.'
    end
    share.install name

    inreplace sourcefile, "DATPRE_VALUE", "#{share}/#{name}"

    system "#{ENV.fc} -O2 -o #{name} #{sourcefile}"
    bin.install name
  end

  def sourcefile
    "#{name}-v#{version}.f"
  end
end

__END__
diff --git a/jktld-v3.f b/jktld-v3.f
index 897ba7f..8e73a89 100755
--- a/jktld-v3.f
+++ b/jktld-v3.f
@@ -108,8 +108,11 @@
 
       integer NFILES                 ! Number of LD coefficient tabulations
       parameter ( NFILES=8 )         ! Number of LD coefficient tabulations
-      character*50 FILES(NFILES)     ! Contains names of the files to do
+      character*255 FILES(NFILES)     ! Contains names of the files to do
       integer NCOL(NFILES)           ! Number of columns of LD coeff in each file
+      character*255 DATPRE
+
+      DATPRE = "DATPRE_VALUE/"
 
       data NCOL / 8,5,11,11,13,11,11,10 /
 
@@ -125,14 +128,14 @@
      &     "Sloan g    ","Sloan r    ","Sloan i    ","Sloan z    ",
      &     "CoRoT white","Kepler     "  /
 
-      data FILES / "/home/jkt/tables/JKTLD-vanhamme.dat"      ,
-     &             "/home/jkt/tables/JKTLD-diazcordoves.dat"  ,
-     &             "/home/jkt/tables/JKTLD-claret2000a.dat"   ,
-     &             "/home/jkt/tables/JKTLD-claret2000p.dat"   ,
-     &             "/home/jkt/tables/JKTLD-claret2003.dat"    ,
-     &             "/home/jkt/tables/JKTLD-claret2004a.dat"   ,
-     &             "/home/jkt/tables/JKTLD-claret2004p.dat"   ,
-     &             "/home/jkt/tables/JKTLD-sing2010.dat"      /
+      FILES(1) = TRIM(DATPRE) // "JKTLD-vanhamme.dat"
+      FILES(2) = TRIM(DATPRE) // "JKTLD-diazcordoves.dat"
+      FILES(3) = TRIM(DATPRE) // "JKTLD-claret2000a.dat"
+      FILES(4) = TRIM(DATPRE) // "JKTLD-claret2000p.dat"
+      FILES(5) = TRIM(DATPRE) // "JKTLD-claret2003.dat"
+      FILES(6) = TRIM(DATPRE) // "JKTLD-claret2004a.dat"
+      FILES(7) = TRIM(DATPRE) // "JKTLD-claret2004p.dat"
+      FILES(8) = TRIM(DATPRE) // "JKTLD-sing2010.dat"
 
       INITVAL = 99.9999d0
       do i = 1,NFILTER
@@ -220,28 +223,28 @@
             ! If a full set of coefficients are wanted then calculate
             ! the results for every LD file and output them to file.
 
-      write (*,'(A24,A50)') "Calculating results for ",FILES(1)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(1)
       CALL DOFILE (FILES(1),NCOL(1),NFILTER,FILTERS,TEFF,LOGG,
      &                                              MOH,VMICRO,VANHAM93)
-      write (*,'(A24,A50)') "Calculating results for ",FILES(2)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(2)
       CALL DOFILE (FILES(2),NCOL(2),NFILTER,FILTERS,TEFF,LOGG,
      &                                              MOH,VMICRO,DIAZCO95)
-      write (*,'(A24,A50)') "Calculating results for ",FILES(3)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(3)
       CALL DOFILE (FILES(3),NCOL(3),NFILTER,FILTERS,TEFF,LOGG,
      &                                             MOH,VMICRO,CLARET00A)
-      write (*,'(A24,A50)') "Calculating results for ",FILES(4)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(4)
       CALL DOFILE (FILES(4),NCOL(4),NFILTER,FILTERS,TEFF,LOGG,
      &                                             MOH,VMICRO,CLARET00P)
-      write (*,'(A24,A50)') "Calculating results for ",FILES(5)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(5)
       CALL DOFILE (FILES(5),NCOL(5),NFILTER,FILTERS,TEFF,LOGG,
      &                                              MOH,VMICRO,CLARHA03)
-      write (*,'(A24,A50)') "Calculating results for ",FILES(6)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(6)
       CALL DOFILE (FILES(6),NCOL(6),NFILTER,FILTERS,TEFF,LOGG,
      &                                             MOH,VMICRO,CLARET04A)
-      write (*,'(A24,A50)') "Calculating results for ",FILES(7)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(7)
       CALL DOFILE (FILES(7),NCOL(7),NFILTER,FILTERS,TEFF,LOGG,
      &                                             MOH,VMICRO,CLARET04P)
-      write (*,'(A24,A50)') "Calculating results for ",FILES(8)
+      write (*,'(A24,A255)') "Calculating results for ",FILES(8)
       CALL DOFILE (FILES(8),NCOL(8),NFILTER,FILTERS,TEFF,LOGG,
      &                                              MOH,VMICRO,SING2010)
 
@@ -652,7 +655,7 @@
       SUBROUTINE DOFILE (FILE,NCOL,NFILTER,FILTERS,TEFF,LOGG,MOH,VMICRO,
      &                                                           OUTPUT)
       implicit none
-      character*50 FILE             ! IN: File containing LD coeffs
+      character*255 FILE             ! IN: File containing LD coeffs
       integer NCOL                  ! IN: Number of columns of LD coeffs
       integer NFILTER               ! IN: Number of filters to do
       character*2 FILTERS(NFILTER)  ! IN: Names of the filters
@@ -672,7 +675,7 @@
 
       open (51,file=FILE,status="old",iostat=ERROR)
       if ( ERROR /= 0 ) then
-        write (*,'(A32,A50)') "### ERROR: problem opening file ",FILE
+        write (*,'(A32,A255)') "### ERROR: problem opening file ",FILE
         write (*,*) " "
         STOP
       end if
