.class public interface abstract Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;
.super Ljava/lang/Object;
.source "WriteBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/WriteBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MentionSuggestionsSupplier"
.end annotation


# virtual methods
.method public abstract findExactMatch(Ljava/lang/String;)I
.end method

.method public abstract getIsShowingMentionsSuggestions()Z
.end method

.method public abstract hideMentionSuggestions()V
.end method

.method public abstract showMentionSuggestionsFor(Ljava/lang/String;)V
.end method
