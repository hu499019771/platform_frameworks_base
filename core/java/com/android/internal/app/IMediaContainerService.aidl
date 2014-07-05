/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.app;

import android.os.ParcelFileDescriptor;
import android.content.pm.PackageInfoLite;
import android.content.res.ObbInfo;

interface IMediaContainerService {
    String copyResourceToContainer(String packagePath, String containerId, String key,
            String resFileName, String publicResFileName, boolean isExternal,
            boolean isForwardLocked, String abiOverride);
    int copyResource(String packagePath, in ParcelFileDescriptor outStream);
    PackageInfoLite getMinimalPackageInfo(String packagePath, int flags, long threshold,
            String abiOverride);
    boolean checkInternalFreeStorage(String packagePath, boolean isForwardLocked, long threshold);
    boolean checkExternalFreeStorage(String packagePath, boolean isForwardLocked, String abiOverride);
    ObbInfo getObbInfo(String filename);
    long calculateDirectorySize(String directory);
    /** Return file system stats: [0] is total bytes, [1] is available bytes */
    long[] getFileSystemStats(String path);
    void clearDirectory(String directory);
    long calculateInstalledSize(String packagePath, boolean isForwardLocked, String abiOverride);
}
