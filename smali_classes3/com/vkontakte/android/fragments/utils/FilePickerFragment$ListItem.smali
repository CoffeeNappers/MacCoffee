.class public Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
.super Ljava/lang/Object;
.source "FilePickerFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/BaseDocument;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ListItem"
.end annotation


# instance fields
.field ext:Ljava/lang/String;

.field file:Ljava/io/File;

.field icon:I

.field subtitle:Ljava/lang/String;

.field thumb:Ljava/lang/String;

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 413
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 416
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->subtitle:Ljava/lang/String;

    .line 417
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->ext:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDate()I
    .locals 1

    .prologue
    .line 438
    const/4 v0, 0x0

    return v0
.end method

.method public getExt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->ext:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 433
    const/4 v0, 0x0

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->title:Ljava/lang/String;

    return-object v0
.end method
