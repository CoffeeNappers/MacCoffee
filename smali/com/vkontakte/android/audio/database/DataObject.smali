.class public abstract Lcom/vkontakte/android/audio/database/DataObject;
.super Ljava/lang/Object;
.source "DataObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/audio/database/DataObject",
        "<*>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field protected static final COLUMNS:[Ljava/lang/String;

.field protected static final INDEX_ID:I


# instance fields
.field private final mDataProvider:Lcom/vkontakte/android/audio/database/DataProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/audio/database/DataProvider",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mId:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 12
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/audio/database/DataObject;->COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/audio/database/DataProvider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/database/DataProvider",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    .local p1, "dataProvider":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<+TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-static {p1}, Lcom/vkontakte/android/audio/utils/Utils;->checkedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/database/DataProvider;

    iput-object v0, p0, Lcom/vkontakte/android/audio/database/DataObject;->mDataProvider:Lcom/vkontakte/android/audio/database/DataProvider;

    .line 18
    return-void
.end method

.method protected static varargs concatColumns([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "src"    # [Ljava/lang/String;
    .param p1, "columns"    # [Ljava/lang/String;

    .prologue
    .line 28
    const/4 v0, 0x2

    new-array v0, v0, [[Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->concatStringArrays([[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public copyFrom(Lcom/vkontakte/android/audio/database/DataObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    .local p1, "object":Lcom/vkontakte/android/audio/database/DataObject;, "TT;"
    return-void
.end method

.method protected fillContentValues(Landroid/content/ContentValues;)V
    .locals 0
    .param p1, "contentValues"    # Landroid/content/ContentValues;

    .prologue
    .line 97
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    return-void
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 37
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    iget-wide v0, p0, Lcom/vkontakte/android/audio/database/DataObject;->mId:J

    return-wide v0
.end method

.method protected loadFromCursor(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 88
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/database/DataObject;->mId:J

    .line 89
    return-void
.end method

.method public remove()Z
    .locals 1

    .prologue
    .line 71
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataObject;->mDataProvider:Lcom/vkontakte/android/audio/database/DataProvider;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/database/DataProvider;->remove(Lcom/vkontakte/android/audio/database/DataObject;)Z

    move-result v0

    return v0
.end method

.method public save()Z
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataObject;->mDataProvider:Lcom/vkontakte/android/audio/database/DataProvider;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/database/DataProvider;->save(Lcom/vkontakte/android/audio/database/DataObject;)Z

    move-result v0

    return v0
.end method

.method setId(J)V
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 41
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    iput-wide p1, p0, Lcom/vkontakte/android/audio/database/DataObject;->mId:J

    .line 42
    return-void
.end method

.method public update()Z
    .locals 1

    .prologue
    .line 61
    .local p0, "this":Lcom/vkontakte/android/audio/database/DataObject;, "Lcom/vkontakte/android/audio/database/DataObject<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/database/DataObject;->mDataProvider:Lcom/vkontakte/android/audio/database/DataProvider;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/database/DataProvider;->update(Lcom/vkontakte/android/audio/database/DataObject;)Z

    move-result v0

    return v0
.end method
