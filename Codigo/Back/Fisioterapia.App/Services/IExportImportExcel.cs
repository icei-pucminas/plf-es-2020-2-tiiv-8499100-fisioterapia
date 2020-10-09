using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Services {
    public interface IExportImportExcel {

        ActionResult ExportarExcel();
        ActionResult ImportarExcel();

    }
}
