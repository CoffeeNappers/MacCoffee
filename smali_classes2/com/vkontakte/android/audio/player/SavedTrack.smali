.class public final Lcom/vkontakte/android/audio/player/SavedTrack;
.super Lcom/vkontakte/android/audio/MusicTrack;
.source "SavedTrack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;
    }
.end annotation


# static fields
.field private static final COLUMNS:[Ljava/lang/String;

.field protected static final COLUMN_FILE:Ljava/lang/String; = "file"

.field protected static final COLUMN_POSITION:Ljava/lang/String; = "position"

.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTrack;",
            ">;"
        }
    .end annotation
.end field

.field private static final INDEX_FILE:I

.field private static final INDEX_POSITION:I

.field public static final PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

.field public static final TABLE:Ljava/lang/String; = "saved_track"


# instance fields
.field public file:Ljava/io/File;

.field public position:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 15
    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTrack$1;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/SavedTrack$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    .line 31
    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;-><init>(Lcom/vkontakte/android/audio/player/SavedTrack$1;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    .line 32
    sget-object v0, Lcom/vkontakte/android/audio/MusicTrack;->COLUMNS:[Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "position"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "file"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTrack;->concatColumns([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->COLUMNS:[Ljava/lang/String;

    .line 35
    sget-object v0, Lcom/vkontakte/android/audio/MusicTrack;->COLUMNS:[Ljava/lang/String;

    array-length v0, v0

    sput v0, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_POSITION:I

    .line 36
    sget v0, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_POSITION:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_FILE:I

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/audio/MusicTrack;Ljava/io/File;)V
    .locals 1
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 52
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;)V

    .line 54
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTrack;->copyBaseValues(Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 55
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    .line 56
    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 63
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->PROVIDER:Lcom/vkontakte/android/audio/player/SavedTrack$SavedTrackProvider;

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;Lcom/vkontakte/android/utils/Serializer;)V

    .line 65
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->position:I

    .line 66
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readJavaSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    .line 67
    return-void
.end method

.method static synthetic access$100()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 13
    sget v0, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_POSITION:I

    return v0
.end method

.method public static createSql()Ljava/lang/String;
    .locals 2

    .prologue
    .line 48
    new-instance v0, Lcom/vkontakte/android/data/db/Table;

    const-string/jumbo v1, "saved_track"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/db/Table;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/SavedTrack;->fillTable(Lcom/vkontakte/android/data/db/Table;)Lcom/vkontakte/android/data/db/Table;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table;->createSql()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static fillTable(Lcom/vkontakte/android/data/db/Table;)Lcom/vkontakte/android/data/db/Table;
    .locals 2
    .param p0, "table"    # Lcom/vkontakte/android/data/db/Table;

    .prologue
    .line 42
    invoke-static {p0}, Lcom/vkontakte/android/audio/MusicTrack;->fillTable(Lcom/vkontakte/android/data/db/Table;)Lcom/vkontakte/android/data/db/Table;

    .line 43
    const-string/jumbo v0, "position"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/db/Table;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    .line 44
    return-object p0
.end method


# virtual methods
.method public copyFrom(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "object"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 95
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/MusicTrack;->copyFrom(Lcom/vkontakte/android/audio/database/DataObject;)V

    move-object v0, p1

    .line 97
    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 98
    .local v0, "savedTrack":Lcom/vkontakte/android/audio/player/SavedTrack;
    iget v1, v0, Lcom/vkontakte/android/audio/player/SavedTrack;->position:I

    iput v1, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->position:I

    .line 99
    iget-object v1, v0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    .line 100
    return-void
.end method

.method public bridge synthetic copyFrom(Lcom/vkontakte/android/audio/database/DataObject;)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTrack;->copyFrom(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method protected fillContentValues(Landroid/content/ContentValues;)V
    .locals 2
    .param p1, "contentValues"    # Landroid/content/ContentValues;

    .prologue
    .line 87
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/MusicTrack;->fillContentValues(Landroid/content/ContentValues;)V

    .line 89
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->COLUMNS:[Ljava/lang/String;

    sget v1, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_POSITION:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->position:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 90
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTrack;->COLUMNS:[Ljava/lang/String;

    sget v1, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_FILE:I

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method protected loadFromCursor(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 79
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/MusicTrack;->loadFromCursor(Landroid/database/Cursor;)V

    .line 81
    sget v0, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_POSITION:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->position:I

    .line 82
    new-instance v0, Ljava/io/File;

    sget v1, Lcom/vkontakte/android/audio/player/SavedTrack;->INDEX_FILE:I

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    .line 83
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 71
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/MusicTrack;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 73
    iget v0, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->position:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeJavaSerializable(Ljava/io/Serializable;)V

    .line 75
    return-void
.end method
