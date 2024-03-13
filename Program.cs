using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;

public class Game
{
    public int GameID { get; set; }
    public string Title { get; set; }
    public string Genre { get; set; }
    public int ReleaseYear { get; set; }
    public int SinglePlayerCount { get; set; }
    public int MultiPlayerCount { get; set; }
    public int SalesCount { get; set; }
    public int StudioID { get; set; }
    public Studio Studio { get; set; }
}

public class Studio
{
    public int StudioID { get; set; }
    public string StudioName { get; set; }
    public int CountryID { get; set; }
    public Country Country { get; set; }
    public int CityID { get; set; }
    public City City { get; set; }
}

public class Country
{
    public int CountryID { get; set; }
    public string CountryName { get; set; }
}

public class City
{
    public int CityID { get; set; }
    public string CityName { get; set; }
}

public class GameDbContext : DbContext
{
    public DbSet<Game> Games { get; set; }
    public DbSet<Studio> Studios { get; set; }
    public DbSet<Country> Countries { get; set; }
    public DbSet<City> Cities { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=(local);Database=TEST3;Trusted_Connection=True;Encrypt=False;");
    }
}


class Program
{
    static void Main(string[] args)
    {
        using (var context = new GameDbContext())
        {

            AddNewStudio(context, "New Studio", 1, 1); 

            UpdateStudio(context, 1, "Updated Studio", 2, 2);

            DeleteStudio(context, "Deleted Studio");

            var singleeeePlayerGamesCount = context.Games.Count(g => g.SinglePlayerCount > 0);
            var multiplayerGamesCount = context.Games.Count(g => g.MultiPlayerCount > 0);
            Console.WriteLine($"Количество соло игр: {singleeeePlayerGamesCount}");
            Console.WriteLine($"Количество онлайн игр: {multiplayerGamesCount}");

            var SuperGenreGame = context.Games.OrderByDescending(g => g.SalesCount).FirstOrDefault();
            Console.WriteLine($"Игра с максимальным кол-вом проданных игр: {SuperGenreGame.Title}");

            var top5GamesBySales = context.Games.OrderByDescending(g => g.SalesCount).Take(5);
            Console.WriteLine("Топ-5 игр по кол-ву продаж:");
            foreach (var game in top5GamesBySales)
            {
                Console.WriteLine($"Название игры: {game.Title}, Количество продаж: {game.SalesCount}");
            }

            var bottom5GamesBySales = context.Games.OrderBy(g => g.SalesCount).Take(5);
            Console.WriteLine("Топ-5 игр по наименшему кол-ву продаж:");
            foreach (var game in bottom5GamesBySales)
            {
                Console.WriteLine($"Название игры: {game.Title}, Количество продаж: {game.SalesCount}");
            }

            var allGames = context.Games.Include(g => g.Studio).ToList();
            Console.WriteLine("Полная информация о каждой игре:");
            foreach (var game in allGames)
            {
                Console.WriteLine($"Название игры: {game.Title}, Жанр: {game.Genre}, Количество продаж: {game.SalesCount}, Студия: {game.Studio.StudioName}");
            }

            var studiosWithPrevalentGenre = context.Studios.Include(s => s.Country).Include(s => s.City).ToList();
            Console.WriteLine("Названия каждой студии и жанра игр, количество которых превышает по созданию в этом жанре:");
            foreach (var studio in studiosWithPrevalentGenre)
            {
                var prevalentGenre = context.Games
                    .Where(g => g.StudioID == studio.StudioID)
                    .GroupBy(g => g.Genre)
                    .OrderByDescending(g => g.Count())
                    .Select(g => g.Key)
                    .FirstOrDefault();

                Console.WriteLine($"Студия: {studio.StudioName}, Самый такой жанр игр: {prevalentGenre}");
            }
            static void AddNewStudio(GameDbContext context, string studioName, int countryID, int cityID)
            {
                var existingStudio = context.Studios.FirstOrDefault(s => s.StudioName == studioName);
                if (existingStudio == null)
                {
                    var newStudio = new Studio
                    {
                        StudioName = studioName,
                        CountryID = countryID,
                        CityID = cityID
                    };
                    context.Studios.Add(newStudio);

                    context.SaveChanges(); 
                    Console.WriteLine("Ура, новая студия появилась.");
                }
                else
                {
                    Console.WriteLine("Название этой студии запантетовано ");
                }
            }


            static void UpdateStudio(GameDbContext context, int studioID, string newStudioName, int newCountryID, int newCityID)
            {
                var studioToUpdate = context.Studios.FirstOrDefault(s => s.StudioID == studioID);
                if (studioToUpdate != null)
                {
                    studioToUpdate.StudioName = newStudioName;
                    studioToUpdate.CountryID = newCountryID;
                    studioToUpdate.CityID = newCityID;
                    context.SaveChanges();
                    Console.WriteLine("История переписана");
                }
                else
                {
                    Console.WriteLine("Похожа эта студия обанкротилась или пропала");
                }
            }

            static void DeleteStudio(GameDbContext context, string studioName)
            {
                var studioToDelete = context.Studios.FirstOrDefault(s => s.StudioName == studioName);
                if (studioToDelete != null)
                {
                    context.Studios.Remove(studioToDelete);
                    context.SaveChanges();
                    Console.WriteLine("Ты снёс фирму");
                }
                else
                {
                    Console.WriteLine("Студии нет, пропала наверное");
                }
            }

            }
        }
    }
