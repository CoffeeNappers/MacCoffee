package com.facebook.common.file;

import com.facebook.common.internal.Preconditions;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
/* loaded from: classes.dex */
public class FileUtils {
    public static void mkdirs(File directory) throws CreateDirectoryException {
        if (directory.exists()) {
            if (!directory.isDirectory()) {
                if (!directory.delete()) {
                    throw new CreateDirectoryException(directory.getAbsolutePath(), new FileDeleteException(directory.getAbsolutePath()));
                }
            } else {
                return;
            }
        }
        if (!directory.mkdirs() && !directory.isDirectory()) {
            throw new CreateDirectoryException(directory.getAbsolutePath());
        }
    }

    public static void rename(File source, File target) throws RenameException {
        Preconditions.checkNotNull(source);
        Preconditions.checkNotNull(target);
        target.delete();
        if (source.renameTo(target)) {
            return;
        }
        Throwable innerException = null;
        if (target.exists()) {
            innerException = new FileDeleteException(target.getAbsolutePath());
        } else if (!source.getParentFile().exists()) {
            innerException = new ParentDirNotFoundException(source.getAbsolutePath());
        } else if (!source.exists()) {
            innerException = new FileNotFoundException(source.getAbsolutePath());
        }
        throw new RenameException("Unknown error renaming " + source.getAbsolutePath() + " to " + target.getAbsolutePath(), innerException);
    }

    /* loaded from: classes.dex */
    public static class CreateDirectoryException extends IOException {
        public CreateDirectoryException(String message) {
            super(message);
        }

        public CreateDirectoryException(String message, Throwable innerException) {
            super(message);
            initCause(innerException);
        }
    }

    /* loaded from: classes.dex */
    public static class ParentDirNotFoundException extends FileNotFoundException {
        public ParentDirNotFoundException(String message) {
            super(message);
        }
    }

    /* loaded from: classes.dex */
    public static class FileDeleteException extends IOException {
        public FileDeleteException(String message) {
            super(message);
        }
    }

    /* loaded from: classes.dex */
    public static class RenameException extends IOException {
        public RenameException(String message) {
            super(message);
        }

        public RenameException(String message, Throwable innerException) {
            super(message);
            initCause(innerException);
        }
    }
}
