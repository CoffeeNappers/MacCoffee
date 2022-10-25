.class public Lcom/vkontakte/android/api/photos/PhotosGetUserPhotosAndNewTags$Result;
.super Ljava/lang/Object;
.source "PhotosGetUserPhotosAndNewTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/photos/PhotosGetUserPhotosAndNewTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public newTags:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/TaggedPhoto;",
            ">;"
        }
    .end annotation
.end field

.field public photos:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;"
        }
    .end annotation
.end field

.field public profiles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
