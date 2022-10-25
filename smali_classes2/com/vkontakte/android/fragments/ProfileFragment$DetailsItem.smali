.class public Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DetailsItem"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field bgType:I

.field public contacts:Ljava/lang/String;

.field public content:Ljava/lang/String;

.field fallbackIntent:Landroid/content/Intent;

.field public image:Ljava/lang/String;

.field intent:Landroid/content/Intent;

.field public isHeader:Z

.field parsedContent:Ljava/lang/CharSequence;

.field public subtitle:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 4464
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem$1;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 4452
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4407
    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    .line 4453
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->title:Ljava/lang/String;

    .line 4454
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->content:Ljava/lang/String;

    .line 4455
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 4456
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->isHeader:Z

    .line 4457
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    .line 4458
    const-class v0, Landroid/content/Intent;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->intent:Landroid/content/Intent;

    .line 4459
    const-class v0, Landroid/content/Intent;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->fallbackIntent:Landroid/content/Intent;

    .line 4460
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->image:Ljava/lang/String;

    .line 4461
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->contacts:Ljava/lang/String;

    .line 4462
    return-void

    .line 4456
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 4431
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    .line 4432
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 7
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "href"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 4427
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    .line 4428
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "subtitle"    # Ljava/lang/String;
    .param p4, "contacts"    # Ljava/lang/String;
    .param p5, "isHeader"    # Z
    .param p6, "intent"    # Landroid/content/Intent;
    .param p7, "image"    # Ljava/lang/String;

    .prologue
    .line 4412
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4407
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    .line 4413
    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->content:Ljava/lang/String;

    .line 4414
    iput-object p6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->intent:Landroid/content/Intent;

    .line 4415
    iput-object p7, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->image:Ljava/lang/String;

    .line 4416
    iput-boolean p5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->isHeader:Z

    .line 4417
    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 4418
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->title:Ljava/lang/String;

    .line 4419
    iput-object p4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->contacts:Ljava/lang/String;

    .line 4420
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V
    .locals 8
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "subtitle"    # Ljava/lang/String;
    .param p4, "isHeader"    # Z
    .param p5, "intent"    # Landroid/content/Intent;
    .param p6, "image"    # Ljava/lang/String;

    .prologue
    .line 4423
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    .line 4424
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 4436
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x0

    .line 4441
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4442
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->content:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4443
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4444
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->isHeader:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 4445
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4446
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 4447
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->fallbackIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 4448
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->image:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4449
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->contacts:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4450
    return-void

    :cond_0
    move v0, v1

    .line 4444
    goto :goto_0
.end method
