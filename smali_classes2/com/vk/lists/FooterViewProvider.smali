.class public interface abstract Lcom/vk/lists/FooterViewProvider;
.super Ljava/lang/Object;
.source "FooterViewProvider.java"


# static fields
.field public static final DEFAULT:Lcom/vk/lists/FooterViewProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    new-instance v0, Lcom/vk/lists/FooterViewProvider$1;

    invoke-direct {v0}, Lcom/vk/lists/FooterViewProvider$1;-><init>()V

    sput-object v0, Lcom/vk/lists/FooterViewProvider;->DEFAULT:Lcom/vk/lists/FooterViewProvider;

    return-void
.end method


# virtual methods
.method public abstract createFooterErrorView(Landroid/content/Context;)Lcom/vk/lists/AbstractErrorView;
.end method

.method public abstract createFooterLoadingView(Landroid/content/Context;)Landroid/view/View;
.end method

.method public abstract createFooterView(Landroid/content/Context;)Lcom/vk/lists/FooterView;
.end method
