.class public Lcom/vkontakte/android/api/wall/WallGet$Result;
.super Ljava/lang/Object;
.source "WallGet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/wall/WallGet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public news:Lcom/vkontakte/android/data/VKList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation
.end field

.field public next_from:Ljava/lang/String;

.field public postponedCount:I

.field public status:Ljava/lang/Object;

.field public suggestedCount:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
