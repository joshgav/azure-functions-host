// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.

using System;
using System.Collections.Generic;
using System.IO;
using Microsoft.Azure.WebJobs.Script.Abstractions;
using Microsoft.Azure.WebJobs.Script.Config;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace Microsoft.Azure.WebJobs.Script.Rpc
{
    internal class GoWorkerProvider : IWorkerProvider
    {
        private const string GO = "Go";
        private const string GOEXT = ".go";

        public WorkerDescription GetDescription() => new WorkerDescription
        {
            Language = GO,
            Extension = GOEXT,
            DefaultExecutablePath = "/azure-functions-runtime/workers/go/go-worker"
        };

        public bool TryConfigureArguments(ArgumentsDescription args, IConfiguration config, ILogger logger)
        {
            return true;
        }

        public string GetWorkerDirectoryPath()
        {
            return WorkerProviderHelper.BuildWorkerDirectoryPath(GO.ToLowerInvariant());
        }
    }
}
