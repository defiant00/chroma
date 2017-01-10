using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace TileMapGen
{
	class Program
	{
		static void Main(string[] args)
		{
			var img = new Bitmap(2048, 2048, PixelFormat.Format32bppArgb);
			var g = Graphics.FromImage(img);

			string tileRelPath = "..\\..\\..\\tiles\\";

			for (int y = 0; y < 8; y++)
			{
				for (int x = 0; x < 64; x++)
				{
					int i = y * 64 + x;
					string fName = tileRelPath + "s" + i.ToString("D4") + ".png";
					if (File.Exists(fName))
					{
						var tile = Image.FromFile(fName);
						g.DrawImage(tile, new Point(x * 32, y * 32));
					}
				}
			}

			for (int y = 4; y < 32; y++)
			{
				for (int x = 0; x < 32; x++)
				{
					int i = (y - 4) * 32 + x;
					string fName = tileRelPath + "l" + i.ToString("D4") + ".png";
					if (File.Exists(fName))
					{
						var tile = Image.FromFile(fName);
						g.DrawImage(tile, new Point(x * 64, y * 64));
					}
				}
			}


			img.Save("..\\..\\..\\..\\assets\\images\\tiles.png", ImageFormat.Png);

			Console.WriteLine("Done, press any key...");
			Console.ReadKey();
		}
	}
}
