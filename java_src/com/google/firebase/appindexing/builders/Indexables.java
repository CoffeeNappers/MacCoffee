package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.zzaa;
import com.google.firebase.appindexing.Indexable;
/* loaded from: classes2.dex */
public final class Indexables {
    private Indexables() {
    }

    public static ConversationBuilder conversationBuilder() {
        return new ConversationBuilder();
    }

    public static DigitalDocumentBuilder digitalDocumentBuilder() {
        return new DigitalDocumentBuilder();
    }

    public static DigitalDocumentPermissionBuilder digitalDocumentPermissionBuilder() {
        return new DigitalDocumentPermissionBuilder();
    }

    public static MessageBuilder emailMessageBuilder() {
        return new MessageBuilder("EmailMessage");
    }

    public static MessageBuilder messageBuilder() {
        return new MessageBuilder();
    }

    public static MusicAlbumBuilder musicAlbumBuilder() {
        return new MusicAlbumBuilder();
    }

    public static MusicGroupBuilder musicGroupBuilder() {
        return new MusicGroupBuilder();
    }

    public static MusicPlaylistBuilder musicPlaylistBuilder() {
        return new MusicPlaylistBuilder();
    }

    public static MusicRecordingBuilder musicRecordingBuilder() {
        return new MusicRecordingBuilder();
    }

    public static Indexable newSimple(@NonNull String str, @NonNull String str2) {
        zzaa.zzy(str);
        zzaa.zzy(str2);
        return new Indexable.Builder().setUrl(str2).setName(str).build();
    }

    public static DigitalDocumentBuilder noteDigitalDocumentBuilder() {
        return new DigitalDocumentBuilder("NoteDigitalDocument");
    }

    public static PersonBuilder personBuilder() {
        return new PersonBuilder();
    }

    public static DigitalDocumentBuilder presentationDigitalDocumentBuilder() {
        return new DigitalDocumentBuilder("PresentationDigitalDocument");
    }

    public static DigitalDocumentBuilder spreadsheetDigitalDocumentBuilder() {
        return new DigitalDocumentBuilder("SpreadsheetDigitalDocument");
    }

    public static DigitalDocumentBuilder textDigitalDocumentBuilder() {
        return new DigitalDocumentBuilder("TextDigitalDocument");
    }
}
