.class public Lcom/vkontakte/android/api/account/AccountGetPingUrl$Result;
.super Ljava/lang/Object;
.source "AccountGetPingUrl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/account/AccountGetPingUrl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public endpointUrl:Ljava/lang/String;

.field public isEnabled:Z

.field public timeInterval:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
