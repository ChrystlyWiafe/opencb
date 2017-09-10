using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Reflection;
using Newtonsoft.Json;
using OpenCBS.ArchitectureV2.Interface.Service;

namespace OpenCBS.ArchitectureV2.Presenter
{
    public class TranslationService : ITranslationService
    {
        private Dictionary<string, string> _strings;

        public string Translate(string key)
        {
            if (_strings == null) return key;
            return !_strings.ContainsKey(key) ? key : _strings[key];
        }

        public void Reload(string cultureName)
        {
            if (cultureName == "fr")
                cultureName = "fr-FR";
            if (cultureName == "en")
                cultureName = "en-US";
            if (cultureName == "ru")
                cultureName = "ru-RU";
            if (cultureName == "pt")
                cultureName = "pt-BR";
            if (cultureName == "es")
                cultureName = "es-ES";

            _strings = null;
            var path = Assembly.GetExecutingAssembly().Location;
            path = Path.GetDirectoryName(path);
            if (string.IsNullOrEmpty(path)) return;

            var fileName = string.Format("{0}.json", cultureName);
            path = Path.Combine(path, "Languages");
            path = Path.Combine(path, fileName);
            if (!File.Exists(path)) return;

            _strings = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(path));
        }

        public void Reload()
        {
            _strings = null;
            var path = Assembly.GetExecutingAssembly().Location;
            path = Path.GetDirectoryName(path);
            if (string.IsNullOrEmpty(path)) return;

            var fileName = string.Format("{0}.json", CultureInfo.CurrentUICulture.Name);
            path = Path.Combine(path, "Languages");
            path = Path.Combine(path, fileName);
            if (!File.Exists(path)) return;

            _strings = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(path));
        }
    }
}
