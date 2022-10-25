.class public Lcom/wmspanel/libstream/ConnectionConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public auth:Lcom/wmspanel/libstream/Streamer$AUTH;

.field public mode:Lcom/wmspanel/libstream/Streamer$MODE;

.field public password:Ljava/lang/String;

.field public uri:Ljava/lang/String;

.field public username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    sget-object v0, Lcom/wmspanel/libstream/Streamer$MODE;->AUDIO_VIDEO:Lcom/wmspanel/libstream/Streamer$MODE;

    iput-object v0, p0, Lcom/wmspanel/libstream/ConnectionConfig;->mode:Lcom/wmspanel/libstream/Streamer$MODE;

    .line 12
    sget-object v0, Lcom/wmspanel/libstream/Streamer$AUTH;->DEFAULT:Lcom/wmspanel/libstream/Streamer$AUTH;

    iput-object v0, p0, Lcom/wmspanel/libstream/ConnectionConfig;->auth:Lcom/wmspanel/libstream/Streamer$AUTH;

    .line 13
    return-void
.end method
