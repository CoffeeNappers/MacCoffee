.class public interface abstract Lcom/vk/music/model/SearchModel$View;
.super Ljava/lang/Object;
.source "SearchModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/SearchModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "View"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/SearchModel$View$Page;,
        Lcom/vk/music/model/SearchModel$View$State;
    }
.end annotation


# static fields
.field public static final PAGE_BY_ARTIST:I = 0x1

.field public static final PAGE_BY_TITLE:I = 0x0

.field public static final STATE_RESULTS:I = 0x1

.field public static final STATE_SEARCHING:I
