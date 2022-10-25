.class public abstract Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;
.super Lcom/vkontakte/android/audio/database/DataProvider;
.source "MusicTrack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/MusicTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "MusicTrackProvider"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">",
        "Lcom/vkontakte/android/audio/database/DataProvider",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "useCache"    # Z

    .prologue
    .line 298
    .local p0, "this":Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;, "Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/audio/database/DataProvider;-><init>(Ljava/lang/String;Z)V

    .line 299
    return-void
.end method


# virtual methods
.method protected getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 303
    .local p0, "this":Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;, "Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider<TT;>;"
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/data/db/Database;->getInst(Landroid/content/Context;)Lcom/vkontakte/android/data/db/Database;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Database;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method protected getProjection()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 308
    .local p0, "this":Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;, "Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider<TT;>;"
    sget-object v0, Lcom/vkontakte/android/audio/MusicTrack;->COLUMNS:[Ljava/lang/String;

    return-object v0
.end method
