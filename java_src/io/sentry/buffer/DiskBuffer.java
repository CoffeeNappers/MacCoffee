package io.sentry.buffer;

import io.sentry.event.Event;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.Arrays;
import java.util.Iterator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class DiskBuffer implements Buffer {
    public static final String FILE_SUFFIX = ".sentry-event";
    private static final Logger logger = LoggerFactory.getLogger(DiskBuffer.class);
    private final File bufferDir;
    private int maxEvents;

    public DiskBuffer(File bufferDir, int maxEvents) {
        this.bufferDir = bufferDir;
        this.maxEvents = maxEvents;
        String errMsg = "Could not create or write to disk buffer dir: " + bufferDir.getAbsolutePath();
        try {
            bufferDir.mkdirs();
            if (!bufferDir.isDirectory() || !bufferDir.canWrite()) {
                throw new RuntimeException(errMsg);
            }
            logger.debug(Integer.toString(getNumStoredEvents()) + " stored events found in dir: " + bufferDir.getAbsolutePath());
        } catch (Exception e) {
            throw new RuntimeException(errMsg, e);
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: BlockProcessor
        jadx.core.utils.exceptions.JadxRuntimeException: Found unreachable blocks
        	at jadx.core.dex.visitors.blocks.DominatorTree.sortBlocks(DominatorTree.java:35)
        	at jadx.core.dex.visitors.blocks.DominatorTree.compute(DominatorTree.java:25)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.computeDominators(BlockProcessor.java:203)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.processBlocksTree(BlockProcessor.java:46)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.visit(BlockProcessor.java:40)
        */
    @Override // io.sentry.buffer.Buffer
    public void add(io.sentry.event.Event r10) {
        /*
            Method dump skipped, instructions count: 330
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: io.sentry.buffer.DiskBuffer.add(io.sentry.event.Event):void");
    }

    @Override // io.sentry.buffer.Buffer
    public void discard(Event event) {
        File eventFile = new File(this.bufferDir, event.getId().toString() + FILE_SUFFIX);
        if (eventFile.exists()) {
            logger.debug("Discarding Event from offline storage: " + eventFile.getAbsolutePath());
            eventFile.delete();
        }
    }

    private Event fileToEvent(File eventFile) {
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(eventFile.getAbsolutePath()));
            ObjectInputStream ois = new ObjectInputStream(fileInputStream);
            Object eventObj = ois.readObject();
            try {
                return (Event) eventObj;
            } catch (Exception e) {
                logger.error("Error casting Object to Event: " + eventFile.getAbsolutePath(), (Throwable) e);
                eventFile.delete();
                return null;
            }
        } catch (Exception e2) {
            logger.error("Error reading Event file: " + eventFile.getAbsolutePath(), (Throwable) e2);
            eventFile.delete();
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Event getNextEvent(Iterator<File> files) {
        Event event;
        while (files.hasNext()) {
            File file = files.next();
            if (file.getAbsolutePath().endsWith(FILE_SUFFIX) && (event = fileToEvent(file)) != null) {
                return event;
            }
        }
        return null;
    }

    @Override // io.sentry.buffer.Buffer
    public Iterator<Event> getEvents() {
        final Iterator<File> files = Arrays.asList(this.bufferDir.listFiles()).iterator();
        return new Iterator<Event>() { // from class: io.sentry.buffer.DiskBuffer.1
            private Event next;

            {
                this.next = DiskBuffer.this.getNextEvent(files);
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.next != null;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Iterator
            /* renamed from: next */
            public Event mo1199next() {
                Event toReturn = this.next;
                this.next = DiskBuffer.this.getNextEvent(files);
                return toReturn;
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    private int getNumStoredEvents() {
        int count = 0;
        File[] arr$ = this.bufferDir.listFiles();
        for (File file : arr$) {
            if (file.getAbsolutePath().endsWith(FILE_SUFFIX)) {
                count++;
            }
        }
        return count;
    }
}
