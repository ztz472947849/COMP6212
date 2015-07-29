stocks = %w(^FTSE AAL.L ABF.L ADM.L ADN.L AGK.L AHT.L ANTO.L ARM.L AV.L AZN.L BA.L BAB.L BARC.L BATS.L BDEV.L BG.L BLND.L BLT.L BNZL.L BP.L BRBY.L BT-A.L CCH.L CCL.L CNA.L CPG.L CPI.L CRH.L DC.L DGE.L DLG.L EXPN.L EZJ.L FLG.L FRES.L GFS.L GKN.L GLEN.L GSK.L HL.L HMSO.L HSBA.L IAG.L IHG.L III.L IMT.L INTU.L ITRK.L ITV.L)

stocks.each do |stock|
  system("curl -o #{stock}.csv 'http://real-chart.finance.yahoo.com/table.csv?s=#{stock}&a=01&b=25&c=2012&d=01&e=25&f=2015&g=d&ignore=.csv'")
end
