CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan`
AS SELECT
   simpanan.id as id,
   'simpanan' AS `tabel`,
   simpanan.kode_nasabah as kode_nasabah,
   simpanan.jumlah as jumlah,
   simpanan.tanggal as tanggal,
   simpanan.jenis as keterangan
FROM `simpanan` 

union select 
	pinjaman.id as id,
	'pinjaman' as tabel,
	pinjaman.kode_nasabah as kode_nasabah,
	pinjaman.jumlah as jumlah,
	pinjaman.tanggal as tanggal,
	pinjaman.lama as keterangan
from `pinjaman` 

union select 
	cicilan.id as id,
	'cicilan' as tabel,
	cicilan.kode_nasabah as kode_nasabah,
	cicilan.jumlah as jumlah,
	cicilan.tanggal as tanggal,
	cicilan.cicilan_ke as keterangan
from `cicilan` 

