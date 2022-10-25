.class public Lcom/vkontakte/android/api/apps/AppGetWithUser$AppGetWithUserResponse;
.super Ljava/lang/Object;
.source "AppGetWithUser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/apps/AppGetWithUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppGetWithUserResponse"
.end annotation


# instance fields
.field public apiApplication:Lcom/vkontakte/android/data/ApiApplication;

.field public user:Lcom/vkontakte/android/UserProfile;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
