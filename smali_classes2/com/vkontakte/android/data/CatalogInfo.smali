.class public Lcom/vkontakte/android/data/CatalogInfo;
.super Ljava/lang/Object;
.source "CatalogInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/CatalogInfo$FilterType;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/data/CatalogInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_GENRE_ID:I = -0x1


# instance fields
.field public final filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

.field public final genre_id:I

.field public platform:Ljava/lang/String;

.field public final title:Ljava/lang/String;

.field public final titleRes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 106
    new-instance v0, Lcom/vkontakte/android/data/CatalogInfo$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/CatalogInfo$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/CatalogInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "titleRes"    # I

    .prologue
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    .line 36
    iput p1, p0, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    .line 37
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    .line 38
    iput-object v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .line 39
    return-void
.end method

.method public constructor <init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;)V
    .locals 1
    .param p1, "titleRes"    # I
    .param p2, "filterType"    # Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    .line 57
    iput p1, p0, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    .line 58
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    .line 59
    iput-object p2, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .line 60
    return-void
.end method

.method public constructor <init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;Ljava/lang/String;)V
    .locals 0
    .param p1, "titleRes"    # I
    .param p2, "filterType"    # Lcom/vkontakte/android/data/CatalogInfo$FilterType;
    .param p3, "platform"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/data/CatalogInfo;-><init>(ILcom/vkontakte/android/data/CatalogInfo$FilterType;)V

    .line 64
    iput-object p3, p0, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 86
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    iput-object v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    .line 90
    return-void

    .line 86
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->values()[Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    move-result-object v1

    aget-object v1, v1, v0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/vkontakte/android/data/GameGenre;)V
    .locals 1
    .param p1, "gameGenre"    # Lcom/vkontakte/android/data/GameGenre;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iget-object v0, p1, Lcom/vkontakte/android/data/GameGenre;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    .line 51
    iget v0, p1, Lcom/vkontakte/android/data/GameGenre;->id:I

    iput v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    .line 43
    iput v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    .line 44
    iput v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    .line 46
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public getServerKey()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-static {v0}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->access$000(Lcom/vkontakte/android/data/CatalogInfo$FilterType;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public hasGenreId()Z
    .locals 2

    .prologue
    .line 68
    iget v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{\"genre_id\"="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", \"filterType\"="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    if-nez v0, :cond_0

    const-string/jumbo v0, "null"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->name()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 94
    iget v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->genre_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 97
    iget v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->titleRes:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string/jumbo v0, ""

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 99
    return-void

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->filterType:Lcom/vkontakte/android/data/CatalogInfo$FilterType;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/CatalogInfo$FilterType;->ordinal()I

    move-result v0

    goto :goto_0

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/data/CatalogInfo;->platform:Ljava/lang/String;

    goto :goto_1
.end method
